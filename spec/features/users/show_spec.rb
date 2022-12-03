require 'rails_helper'

RSpec.describe 'user show page', :vcr, type: :feature do
  let!(:kenz) {create(:user, name: 'Kenz', email: 'kenz_mail@gmail.com')}
  let!(:astrid) {create(:user, name: 'Astrid', email: 'astrid_mail@gmail.com')}
  let!(:reba) {create(:user, name: 'Reba', email: 'reba_mail@gmail.com')}

  let!(:party_1) {create(:party, movie_id: 550, duration: 170, date: Date.new(2022,12,20), start_time: DateTime.new(2022,12,20,18,30,00))}
  let!(:party_2) {create(:party, movie_id: 700, duration: 160, date: Date.new(2022,12,27), start_time: DateTime.new(2022,12,27,20,00,00))}
  
  let!(:user_party_1) {create(:user_party, user: kenz, party: party_1)}
  let!(:user_party_1) {create(:user_party, user: astrid, party: party_1)}
  let!(:user_party_1) {create(:user_party, user: astrid, party: party_2)}
  let!(:user_party_1) {create(:user_party, user: reba, party: party_2)}

  before(:each) do
    visit user_path(reba)

  end

  describe 'as a user' do 
    describe 'when I visit user_path(:id)' do
      it '- shows the users name at the top of the page' do
        expect(page).to have_content("Reba's Dashboard")
      end

      it '- has a button to discover movies' do
        expect(page).to have_button('Discover Movies')
        
        click_button 'Discover Movies'

        expect(current_path).to eq(discover_path(reba))
      end

      it '- has a section that lists the users viewing parties' do
        expect(page).to have_css("#user-parties")

        within "#user-parties" do
          expect(page).to have_content("Octopussy")
          expect(page).to have_content("December 27, 2022")
          expect(page).to have_content("8:00 pm")
        end
      end
    end
  end
end

