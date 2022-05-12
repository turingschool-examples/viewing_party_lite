require 'rails_helper'

RSpec.describe 'User Discovery Page', type: :feature do

  describe 'As a Visitor' do 

    it 'the discover movies button takes me to the discover movies page' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')

      visit "/users/#{skeeter.id}"
      click_button "Discover Movies"

      expect(current_path).to eq("/users/#{skeeter.id}/discover")
    end 

    it 'has a Top Rated Movies button and a Search by Movie Title field' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      visit "/users/#{skeeter.id}/discover"
    
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_button("Find Movies")
    end 

    it 'clicking the Top Rated Movies button takes me to the movie results page' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      visit "/users/#{skeeter.id}/discover"

      click_button "Find Top Rated Movies"
      
      expect(current_path).to eq("/users/#{skeeter.id}/movies")
      expect(page).to have_content("Top Rated Movies")

      expect(page).to_not have_content("Movie Results for:")
    end 

    it 'clicking the Find Movies button takes me to the movie results page' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      visit "/users/#{skeeter.id}/discover"

      fill_in "Search by Movie Title", with: "Jaws"
      click_on "Find Movies"
      
      expect(current_path).to eq("/users/#{skeeter.id}/movies")
      expect(page).to have_content("Movie Results for: Jaws")
      
      expect(page).to_not have_content("Top Rated Movies")
    end 

  end 

end 