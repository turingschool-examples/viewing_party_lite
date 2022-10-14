require 'rails_helper'
require 'date'

RSpec.describe 'the User Show Page', :vcr do


  let!(:user1) {create(:user, id: 5, name: "Jim Lahey", email: "supervisor@sunnyvale.ca")}
  let!(:party1) {create(:party, id: 10, movie_id: 550, date: Date.today, start_time: Time.now, duration: 350)}

  let!(:party2) {create(:party, id: 22, movie_id: 551, date: Date.yesterday, start_time: Time.now, duration: 400)}
  
  let!(:user2) {create(:user, id: 6, name: "Ricky Lafleur", email: "ricky_lafleur@sunnyvale.ca")}
  let!(:party3) {create(:party, id: 8, movie_id: 552, date: Date.tomorrow, start_time: Time.now, duration: 300 )}
  
  let!(:user3) {create(:user, id: 7, name: "Randy Bobandy", email: "assistantsupervisor@sunnyvale.ca")}
  
  let!(:user_party1) {create(:user_party, user: user1, party: party1, user_status: 0)}
  let!(:user_party2) {create(:user_party, user: user1, party: party2, user_status: 1)}
  let!(:user_party3) {create(:user_party, user: user2, party: party3, user_status: 2)}

  before :each do
      visit "/users/#{user1.id}"
  end

  describe 'the dashboard content' do
    it 'has the users name' do
      # visit "/users/#{user1.id}"
      expect(page).to have_content("#{user1.name}'s Dashboard")
      expect(page).to_not have_content("#{user2.name}'s Dashboard")
    end

    it 'has discover movies button' do
      # visit "/users/#{user1.id}"
      expect(page).to have_button("Discover Movies")
      # click_button
      # expect(current_path).to eq("/user/#{user1.id}/discover")
    end

    it 'has a viewing parties section' do
      expect(page).to have_selector('#user-parties')
    end

    it 'within which the correct number of viewing parties are listed, if any' do
      # [user1, user2, user3].each_with_index do |user, index|
        # visit user_path(user1)
        within '#user-parties' do
          expect(page).to have_selector('.party-card', count: 2)
        end
      # end
    end

    it 'within which the cards display correct party info (no api info yet)' do
      within '#user-parties' do
        within "#party-#{party1.id}" do
          expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/original']")
          expect(page).to have_content(party1.date.strftime('%B %d, %Y'))
         
          expect(page).to have_content(party1.start_time.strftime('%I:%M %P'))
          expect(page).to have_content(user_party1.user_status)
        end
        expect(page).to_not have_selector("#party-#{party3.id}")
      end
    end
  end

  describe 'rendering api details' do
    context 'a given card' do
      it 'has info that matches api info for movie with the party movie_id' do
        within '#user-parties' do
          within "#party-#{party1.id}" do
            party_info = MovieFacade.info_card(party1.movie_id)
            expect(page).to have_content(party_info[:title])
            expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/original#{party_info[:img_path]}']")
          end
        end
      end
    end
  end
end