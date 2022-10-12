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

    xit 'There is a date and time of the event' do
      user = create(:user)
      party = create(:party)
      viewing_party = create(:userParty, user_id: user.id, party_id: party.id, movie_id: 550)
      expect(page).to have_content(party.start_time)
      expect(page).to have_content(party.date)
    end
    
    xit 'There is a list of invited users with my name in bold' do

    end

    xit 'I should also see viewing parties where I am the host' do

    end
  end
end