require 'rails_helper'

RSpec.describe 'Movies Results Page', type: :feature do
  before :each do
    user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end

  describe 'As a Visitor' do 

    it 'clicking Find Top Rated Movies displays the top rated movies and their vote average on the results page', :vcr do
      visit "/discover"

      click_button "Find Top Rated Movies"
     
      expect(page).to have_content("Top Rated Movies") 
      expect(page).to have_content("The Shawshank Redemption | Average Rating: 8.7")
      expect(page).to have_content("\nThe Godfather | Average Rating: 8.7\n")
      
      expect(page).to_not have_content("Cars 2 | Average Rating: 9.9")
    end 

    it 'searching for a movie by title returns all movies with search word in title', :vcr do
      visit "/discover"

      fill_in "Search by Movie Title", with: "jaws"
      click_on "Find Movies"
      
      expect(page).to have_content("Movie Results for: jaws")
      expect(page).to have_content("\nJaws | Average Rating: 7.6\n")
      expect(page).to have_content("\nJaws 3-D | Average Rating: 4.4\n")
      expect(page).to have_content("\nJaws of Satan | Average Rating: 5\n")

      expect(page).to_not have_content("The Shawshank Redemption, Average Rating: 8.7")
      
    end 

    it 'has a button to return back to the users discovery page', :vcr do
      visit "/discover"
      click_button "Find Top Rated Movies"

      click_on "Discover Page"
      expect(current_path).to eq("/discover")
    end 

    it 'each top movie result displayed is a link to that movies movie detail page', :vcr do
      visit "/discover"
      click_button "Find Top Rated Movies"
 
      click_link "The Shawshank Redemption"
      expect(current_path).to eq("/movies/278")
    end 

    it 'each search result movie is a link to that movies detail page', :vcr do

      visit "/discover"
  
      fill_in "Search by Movie Title", with: "jaws"
      click_on "Find Movies"

      click_link "Jaws 3-D"
      expect(current_path).to eq("/movies/17692")

    end 

  end 
end 