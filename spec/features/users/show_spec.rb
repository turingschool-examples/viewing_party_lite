require 'rails_helper'

RSpec.describe 'User Dashboard' do
  @users = let!(:users) { create_list(:user, 3) }

  describe 'When I visit /users/:id where :id is a valid user id' do
    it 'I should see the user names dasboard at the top of the page, a button to discover movies, and a section that lists viewing parties' do
      user1 = users[0]
      user2 = users[1]
      user3 = users[2]

      visit user_path(user1)
      
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
    it 'shows the viewing parties that the user has been invited to' do 
      user1 = users[0] 

      # invited to 
      shawshank = ViewingParty.create!(movie_id: 278, duration: 142, date: '08/31/2022', start_time: '7:00pm')
      ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: shawshank.id, host: false) 

      whiplash = ViewingParty.create!(movie_id: 244786, duration: 107, date: '09/22/2022', start_time: '8:00pm')
      ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: whiplash.id, host: false) 

      # hosting 
      godfather = ViewingParty.create!(movie_id: 238, duration: 175, date: '10/04/2022', start_time: '18:00')
      ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: godfather.id, host: true) 

      # need to do start_time.strftime("%I:%M%p") in view to display just the time 



      
    end
  end
end