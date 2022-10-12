require 'rails_helper'

RSpec.describe 'User show page' do
  describe "When I visit '/users/:id' where :id is a valid user id" do
    it "I see '<user's name>'s Dashboard' at the top of the page" do
      user = create(:user)
      visit user_path(user)
      expect(page).to have_content(user.name)
    end

    it 'There is a button that leads to the Discover Movies page' do
      user = create(:user)
      visit user_path(user)
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      expect(current_path).to eq("/users/#{user.id}/discover")
    end

    it 'There is a section that lists viewing parties' do
      user = create(:user)
      visit user_path(user)
      expect(page).to have_content('Viewing Parties')
    end
  end

  describe 'In the user viewing party section of the page' do
    it 'There is a movie image', :vcr do
      user = create(:user)
      party = create(:party, movie_id: 550)
      viewing_party = create(:userParty, user_id: user.id, party_id: party.id, is_host: true)
      visit user_path(user)

      expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg']")
    end

    it 'There is a date and time of the event', :vcr do
      user = create(:user)
      party = create(:party, movie_id: 550)
      viewing_party = create(:userParty, user_id: user.id, party_id: party.id, is_host: true)
      visit user_path(user)
      expect(page).to have_content(party.start_time)
      expect(page).to have_content(party.date)
    end
    
    it 'There is a list of invited users with my name in bold' do
      users = create_list(:user, 5)
      parties = create_list(:party, 3)

      create(:userParty, user_id: users[1].id, party_id: parties[1].id, is_host: true)
      create(:userParty, user_id: users[0].id, party_id: parties[1].id, is_host: false)
      create(:userParty, user_id: users[2].id, party_id: parties[1].id, is_host: false)
    end

    it 'I should not see parties I am not invited to' do

      users = create_list(:user, 5)
      party = create(:party)

      create(:userParty, user_id: users[1].id, party_id: party.id, is_host: true)
      create(:userParty, user_id: users[2].id, party_id: party.id, is_host: false)
      create(:userParty, user_id: users[3].id, party_id: party.id, is_host: false)

      visit user_path(users[0])

      expect(page).not_to have_content('Start time:')
      expect(page).not_to have_content('Date:')
    end

    xit 'I should also see viewing parties where I am the host' do
      users = create_list(:user, 5)
      party = create(:party)
      party2 = create(:party)

      create(:userParty, user_id: users.first.id, party_id: party.id, is_host: true)
      create(:userParty, user_id: users[1].id, party_id: party.id, is_host: false)
      create(:userParty, user_id: users[2].id, party_id: party.id, is_host: false)
      create(:userParty, user_id: users[3].id, party_id: party.id, is_host: false)
      
      create(:userParty, user_id: users[2].id, party_id: party.id, is_host: false)
      create(:userParty, user_id: users[3].id, party_id: party.id, is_host: false)

      within "#party-#{party.id}"
        expect(page).to have_content('You are the host')
      end
    end
  end
end