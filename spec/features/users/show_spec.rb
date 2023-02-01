require 'rails_helper'

RSpec.describe 'The User Dashboard (Show Page)', type: :feature do
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }
  let!(:user2) { User.create!(name: "Thomas", email: "thomas@gmail.com") }
  let!(:user3) { User.create!(name: "Jessica", email: "jessica@gmail.com") }
  let!(:party1) { Party.create!(duration: 160, start_time: Time.now, movie_id: 1 ) }
  let!(:user_party1) { UserParty.create!(user: user1, party: party1, is_host: true) } 
  let!(:user_party2) { UserParty.create!(user: user2, party: party1, is_host: false) } 

  describe 'the basics' do
    it 'has the users name in the title' do
      visit user_path(user1)

      expect(page).to have_content("#{user1.name}'s Dashboard")      
      expect(page).to_not have_content("#{user2.name}'s Dashboard")      
    end
    
    it 'has a button to discover movies' do
      visit user_path(user1)

      expect(page).to have_button("Discover Movies")
    end
    
    it 'will take you to discover movies page on button click' do
      visit user_path(user1)

      click_button("Discover Movies")

      expect(current_path).to eq(user_discover_index_path(user1))

      expect(page).to have_content("#{user1.name}'s Discover Movies Page")
    end
  end

  describe 'the viewing parties section' do
    it 'lists the parties the user is invited to' do
      visit user_path(user1)

      within "#viewing-parties" do
        expect(page).to have_content(party1.start_time)
        expect(page).to have_content(party1.duration)
        expect(page).to have_content(user1.name)
        expect(page).to have_content(user2.name)
      end
    end
  end
end