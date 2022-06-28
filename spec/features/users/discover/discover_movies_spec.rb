require 'rails_helper'

RSpec.describe 'User Discovery Page', type: :feature do
  before :each do
    user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end

  describe 'As a Visitor' do 

    it 'the discover movies button takes me to the discover movies page', :vcr do
      visit "/dashboard"
    
      click_button "Discover Movies"
  
      expect(current_path).to eq("/discover")
    end 

    it 'has a Top Rated Movies button and a Search by Movie Title field', :vcr do
      visit "/discover"
    
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_button("Find Movies")
    end 

    it 'clicking the Top Rated Movies button takes me to the movie results page', :vcr do
      visit "/discover"

      click_button "Find Top Rated Movies"
      
      expect(current_path).to eq("/movies")
      expect(page).to have_content("Top Rated Movies")

      expect(page).to_not have_content("Movie Results for:")
    end 

    it 'clicking the Find Movies button takes me to the movie results page', :vcr do
      visit "/discover"

      fill_in "Search by Movie Title", with: "Jaws"
      click_on "Find Movies"
      
      expect(current_path).to eq("/movies")
      expect(page).to have_content("Movie Results for: Jaws")
      
      expect(page).to_not have_content("Top Rated Movies")
    end 

  end 

end 