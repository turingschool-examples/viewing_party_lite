require 'rails_helper'

RSpec.describe "the User Show page aka the user's dashboard" do 
  describe "when a user visits '/users/:id' where id is a valid user id" do 
    it "shows '<user name>'s Dashboard', a Discover Movies button, and a list of that user's viewing parties" do 
      user = User.create!(name: 'Amanda', email: 'amanda@turing.ed')
      party_1 = ViewingParty.create!(movie_id: 1, movie_title: "The Princess Bride", duration: 180, date: '2022-12-12', start_time: '17:00')
      party_2 = ViewingParty.create!(movie_id: 2, movie_title: "Jurassic Park", duration: 200, date: '2022-12-13', start_time: '19:00')
      UserViewingParty.create!(user: user, viewing_party: party_1, status: "Hosting")
      UserViewingParty.create!(user: user, viewing_party: party_2, status: "Invited")

      visit user_path(user)

      expect(page).to have_content("Amanda's Dashboard")
      expect(page).to have_button("Discover Movies")

      within "#viewing-party-#{party_1.id}" do 
        expect(page).to have_content("The Princess Bride")
        expect(page).to have_content("December 12, 2022")
        expect(page).to have_content("5:00 PM")
        expect(page).to have_content("Hosting")
      end

      within "#viewing-party-#{party_2.id}" do 
        expect(page).to have_content("Jurassic Park")
        expect(page).to have_content("December 13, 2022")
        expect(page).to have_content("7:00 PM")
        expect(page).to have_content("Invited")
      end

      click_button("Discover Movies")
      
      expect(current_path).to eq("/users/#{user.id}/discover")
    end
  end
end