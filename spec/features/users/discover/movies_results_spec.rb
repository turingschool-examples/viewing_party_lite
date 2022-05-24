require 'rails_helper'

RSpec.describe 'Movies Results Page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
    @user2 = User.create!(name: 'Alex', email: 'alex@alex.com', password: 'test123')
    visit '/'

    click_button 'Login'
    fill_in 'Name:', with: 'Skeeter'
    fill_in 'Email:', with: 'skeeter@skeeter.com'
    fill_in 'Password', with: 'test'
    click_on 'Log In'
  end

  describe 'As a Visitor' do 

    it 'clicking Find Top Rated Movies displays the top rated movies and their vote average on the results page', :vcr do
      # skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      visit "/discover"

      click_button "Find Top Rated Movies"
      expect(page).to have_content("Top Rated Movies") 
      expect(page).to have_content("The Shawshank Redemption, Average Vote: 8.7")
      expect(page).to have_content("The Godfather, Average Vote: 8.7")
      
      expect(page).to_not have_content("Cars 2, Average Vote: 9.9")
    end 

    it 'searching for a movie by title returns all movies with search word in title', :vcr do
      # skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      visit "/discover"

      fill_in "Search by Movie Title", with: "jaws"
      click_on "Find Movies"
  
      expect(page).to have_content("Movie Results for: jaws")
      expect(page).to have_content("Jaws, Average Vote: 7.6")
      expect(page).to have_content("Jaws 3-D, Average Vote: 4.4")
      expect(page).to have_content("Jaws of Satan, Average Vote: 5")

      expect(page).to_not have_content("The Shawshank Redemption, Average Vote: 8.7")
      
    end 

    it 'has a button to return back to the users discovery page', :vcr do
      # skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      visit "/discover"
      click_button "Find Top Rated Movies"

      click_on "Discover Page"
      expect(current_path).to eq("/discover")
    end 

    it 'each top movie result displayed is a link to that movies movie detail page', :vcr do
      # skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      visit "/discover"
      click_button "Find Top Rated Movies"
 
      click_link "The Shawshank Redemption"
      expect(current_path).to eq("/users/#{@user1.id}/movies/278")
    end 

    it 'each search result movie is a link to that movies detail page', :vcr do

      # skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      visit "/discover"
  
      fill_in "Search by Movie Title", with: "jaws"
      click_on "Find Movies"

      click_link "Jaws 3-D"
      expect(current_path).to eq("/users/#{@user1.id}/movies/17692")

    end 

  end 
end 