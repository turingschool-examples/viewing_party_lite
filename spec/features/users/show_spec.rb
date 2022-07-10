require 'rails_helper'

RSpec.describe 'User Dashboard Page', type: :feature do

  describe 'data is displayed on page'do
    it 'shows user name on dashboard' do
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Lola', email: 'lola@example.com')

      visit user_path(user1.id)
      expect(page).to have_content("#{user1.name}'s Dashboard")
      expect(page).to_not have_content("#{user2.name}'s Dashboard")
    end

    it 'has a button to Discover Movies' do
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Lola', email: 'lola@example.com')

      visit user_path(user1.id)

      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')

      expect(current_path).to eq("/users/#{user1.id}/discover")
      expect(page).to have_content("#{user1.name}'s Discover Page")
    end
  end
  
  describe 'viewing parties section' do 
    it "has a section that lists the viewing parties" do
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Lola', email: 'lola@example.com')
  
      visit user_path(user1.id)
      expect(page).to have_content("Viewing Parties")
    end

    it 'shows the movie attributes', :vcr do 
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Lola', email: 'lola@example.com')

      party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")
      party2 = ViewingParty.create!(movie_id: 545611, duration: 175, date: Date.new(2023,4,4), start_time: "19:00:00")
      party3 = ViewingParty.create!(movie_id: 284053, duration: 145, date: Date.new(2022,10,5), start_time: "17:30:00")

      user_viewing1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id, host: false)
      user_viewing2 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party2.id, host: false)
      user_viewing3 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party3.id, host: false)

      visit user_path(user1.id)

      within '.invites' do 
        expect(page).to have_content('Spirited Away')
        expect(page).to have_content('Everything Everywhere All at Once')
        expect(page).to_not have_content('Thor Ragnarok')
        click_link 'Spirited Away'
      end
      expect(current_path).to eq(user_movie_path(user1.id, party1.movie_id))
    end

    it 'shows the party attributes', :vcr do 
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")
      user_viewing1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id, host: false)

      visit user_path(user1.id)

      within '.invites' do 
        expect(page).to have_content("Date: Sep 7, 2022")
        expect(page).to have_content(" 4:00 PM")
      end
    end

    it 'can identify the host', :vcr do 
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Lola', email: 'lola@example.com')
      user3 = User.create!(name: 'Squiggles', email: 'goblindog@dogsshouldbeabletovote.org')

      party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")

      user_viewing1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id, host: false)
      user_viewing2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id, host: false)
      user_viewing3 = UserViewingParty.create!(user_id: user3.id, viewing_party_id: party1.id, host: true)

      visit user_path(user1.id)

      within '.invites' do 
        expect(page).to have_content("Host: Squiggles")
        expect(page).to_not have_content("Host: Parker")
      end
    end 

    it 'can list the attendees', :vcr do 
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Lola', email: 'lola@example.com')
      user3 = User.create!(name: 'Squiggles', email: 'goblindog@dogsshouldbeabletovote.org')
      user4 = User.create!(name: 'Pancakes', email: 'spacecadet42@hootmail.com')

      party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")

      user_viewing1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id, host: false)
      user_viewing2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id, host: false)
      user_viewing3 = UserViewingParty.create!(user_id: user3.id, viewing_party_id: party1.id, host: true)
      user_viewing4 = UserViewingParty.create!(user_id: user4.id, viewing_party_id: party1.id, host: false)

      visit user_path(user1.id)

      within ".guests" do 
        expect(page).to have_content("Parker")
        expect(page).to have_content("Pancakes")
        expect(page).to have_content("Lola")
        expect(page).to_not have_content("Squiggles")
      end
    end

    it 'has a section for parties I created with me as the host',:vcr do 
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Lola', email: 'lola@example.com')
      user3 = User.create!(name: 'Squiggles', email: 'goblindog@dogsshouldbeabletovote.org')
      user4 = User.create!(name: 'Pancakes', email: 'spacecadet42@hootmail.com')

      party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")
      party2 = ViewingParty.create!(movie_id: 545611, duration: 175, date: Date.new(2023,4,4), start_time: "19:00:00") 

      user_viewing1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id, host: true)
      user_viewing2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id, host: false)
      user_viewing3 = UserViewingParty.create!(user_id: user3.id, viewing_party_id: party1.id, host: false)
      user_viewing4 = UserViewingParty.create!(user_id: user4.id, viewing_party_id: party1.id, host: false)
      user_viewing5 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party2.id, host: false)
      user_viewing6 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party2.id, host: true)

      visit user_path(user1.id)

      within '.hostParty' do 
        expect(page).to have_content('Host: Parker')
        expect(page).to have_content('Spirited Away')
        expect(page).to_not have_content('Host: Squiggles')
      end

      within '.invites' do 
        expect(page).to have_content('Parker')
        expect(page).to have_content('Host: Lola')
        expect(page).to_not have_content('Squiggles')
        expect(page).to have_link('Everything Everywhere All at Once')
      end
    end

    it 'has a list of friends I have invited to the party', :vcr do 
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Lola', email: 'lola@example.com')
      user3 = User.create!(name: 'Squiggles', email: 'goblindog@dogsshouldbeabletovote.org')
      user4 = User.create!(name: 'Pancakes', email: 'spacecadet42@hootmail.com')

      party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00") 

      user_viewing1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id, host: true)
      user_viewing2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id, host: false)
      user_viewing3 = UserViewingParty.create!(user_id: user3.id, viewing_party_id: party1.id, host: false)
      user_viewing4 = UserViewingParty.create!(user_id: user4.id, viewing_party_id: party1.id, host: false)

      visit user_path(user1.id)
      save_and_open_page
      within '.friends' do 
        expect(page).to have_content('Lola')
        expect(page).to have_content('Pancakes')
        expect(page).to have_content('Squiggles')
      end
    end
  end 
end
