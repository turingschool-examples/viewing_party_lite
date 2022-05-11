require 'rails_helper'

RSpec.describe 'Movies Results Page', type: :feature do

  describe 'As a Visitor' do 

    it 'clicking Find Top Rated Movies displays the top rated movies and their vote average on the results page' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      visit "/users/#{skeeter.id}/discover"

      click_button "Find Top Rated Movies"
      expect(page).to have_content("Top Rated Movies") 
      expect(page).to have_content("The Shawshank Redemption, Average Vote: 8.7")
      expect(page).to have_content("The Godfather, Average Vote: 8.7")
      
      expect(page).to_not have_content("Cars 2, Average Vote: 9.9")
    end 

    it 'searching for a movie by title returns all movies with search word in title' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      visit "/users/#{skeeter.id}/discover"

      fill_in "Search by Movie Title", with: "jaws"
      click_on "Find Movies"
  
      expect(page).to have_content("Movie Results for: jaws")
      expect(page).to have_content("Jaws, Average Vote: 7.6")
      expect(page).to have_content("Jaws 3-D, Average Vote: 4.4")
      expect(page).to have_content("Jaws of Satan, Average Vote: 5")

      expect(page).to_not have_content("The Shawshank Redemption, Average Vote: 8.7")
      
    end 

    it 'has a button to return back to the users discovery page' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      visit "/users/#{skeeter.id}/discover"
      click_button "Find Top Rated Movies"

      click_on "Discover Page"
      expect(current_path).to eq("/users/#{skeeter.id}/discover")
    end 

    it 'each movie result displayed is a link to that movies movie detail page' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      visit "/users/#{skeeter.id}/discover"
      click_button "Find Top Rated Movies"
 
      click_link "The Shawshank Redemption"
      expect(current_path).to eq("/users/#{skeeter.id}/movies/278")
    end 

  end 
end 