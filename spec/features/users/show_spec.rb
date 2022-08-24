require 'rails_helper'

RSpec.describe 'User Dashboard' do
  @users = let!(:users) { create_list(:user, 3) }

  describe 'When I visit /users/:id where :id is a valid user id' do
    it 'I should see the user names dasboard at the top of the page, a button to discover movies, and a section that lists viewing parties' do
      user1 = users[0]
      user2 = users[1]
      user3 = users[2]

      visit user_path(user1)
      save_and_open_page
      
      expect(page).to have_content("#{user1.name}'s Dashboard")
      expect(page).to_not have_content("#{user2.name}'s Dashboard")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Viewing Parties")
    end
  end

  describe 'when I go to a user dashboard and click on Discover Movies button' do 
    it 'redirects to a discover page' do 
      user1 = users[0]

      visit user_path(user1)

      click_button 'Discover Movies'

      expect(current_path).to eq "/users/#{user1.id}/discover"
    end
  end

  describe 'viewing parties section' do 
    it 'shows the viewing parties that the user has been invited to', :vcr do 
      user1 = users[0] 
      user2 = users[1]
      user3 = users[2]

      ## whiplash 
      whiplash = ViewingParty.create!(movie_id: 244786, duration: 107, date: '09/22/2022', start_time: '8:00pm')
      # user 1 invited 
      ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: whiplash.id, host: false) 
      # user 2 invited 
      ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: whiplash.id, host: false) 
      # user 3 hosting 
      ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: whiplash.id, host: true) 

      ## shawshank
      shawshank = ViewingParty.create!(movie_id: 278, duration: 142, date: '08/31/2022', start_time: '7:00pm')
      # user 1 invited 
      ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: shawshank.id, host: false) 
      # user 2 hosting 
      ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: shawshank.id, host: true) 
      # user 3 invited 
      ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: shawshank.id, host: false) 

      ## godfather  
      godfather = ViewingParty.create!(movie_id: 238, duration: 175, date: '10/04/2022', start_time: '18:00')
      # user 1 hosting 
      ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: godfather.id, host: true) 
      # user 2 invited 
      ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: godfather.id, host: false) 
      # user 3 invited 
      ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: godfather.id, host: false) 

      visit user_path(user1)
      
      within("#vp-#{whiplash.id}") do 
        expect(page.find("#img-#{whiplash.id}")['src']).to have_content 'https://image.tmdb.org/t/p/w200/3bhkrj58Vtu7enYsRolD1fZdja1.jpg'

        expect(page.find("#img-#{whiplash.id}")['alt']).to match(/#{whiplash.name}/)

        expect(page).to have_link "#{whiplash.name}"

        expect(page).to have_content "Start Time: #{whiplash.start_time} on #{whiplash.date}"

        expect(page).to have_content "Host: #{user3.name}"

        expect(page).to have_content "Invited Users"
        page.html.should include('<b><%= @user.name %></b>')
        expect(page).to have_content user2.name
      end

      within("#vp-#{shawshank.id}") do 
        expect(page.find("#img-#{shawshank.id}")['src']).to have_content 'https://image.tmdb.org/t/p/w200/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg'

        expect(page.find("#img-#{shawshank.id}")['alt']).to match(/#{shawshank.name}/)

        expect(page).to have_link "#{shawshank.name}"

        expect(page).to have_content "Start Time: #{shawshank.start_time} on #{shawshank.date}"

        expect(page).to have_content "Host: #{user2.name}"

        expect(page).to have_content "Invited Users"
        page.html.should include('<b><%= @user.name %></b>')
        expect(page).to have_content user3.name
      end

      within("#vp-#{godfather.id}") do 
        expect(page.find("#img-#{godfather.id}")['src']).to have_content 'https://image.tmdb.org/t/p/w200/3bhkrj58Vtu7enYsRolD1fZdja1.jpg'

        expect(page.find("#img-#{godfather.id}")['alt']).to match(/#{godfather.name}/)

        expect(page).to have_link "#{godfather.name}"

        expect(page).to have_content "Start Time: #{godfather.start_time} on #{godfather.date}"

        expect(page).to have_content "Host: #{user1.name}"

        expect(page).to have_content "Invited Users"
        expect(page).to have_content user2.name
        expect(page).to have_content user3.name
      end

      click_link "#{whiplash.name}"
      expect(current_path).to eq "/users/#{user1.id}/movies/#{whiplash.id}"      
    end
  end
end

# <a href="https://image.tmdb.org/t/p/w200/3bhkrj58Vtu7enYsRolD1fZdja1.jpg">
#   <img alt = 'Godfather' src="https://image.tmdb.org/t/p/w200/3bhkrj58Vtu7enYsRolD1fZdja1.jpg">
# </a>

# need to do start_time.strftime("%I:%M%p") in view to display just the time 
# https://www.w3schools.com/tags/tryit.asp?filename=tryhtml5_input_type_time
