require 'rails_helper'

RSpec.describe "Movie Index Page" do
  describe 'As a user when I visit the Movies Results Page', :vcr do
    it 'has a button to discover top rated movies' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{user1.id}/discover"
        click_button "Discover Top Rated Movies"
        
        expect(current_path).to eq("/users/#{user1.id}/movies")
        expect(page).to have_content("The Shawshank Redemption")
    end
    it 'has a search function that displays matching movies' do
        @user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{@user1.id}/discover"
        expect(page).to have_button("Search")

        fill_in :search, with: "Impossible Things"
        click_on "Search"
        expect(page).to have_content("Impossible Things")
    end
    it 'has a button to return to discover page' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{user1.id}/movies?"
        
        expect(page).to have_button("Discover Movies")
        click_button "Discover Movies"
        expect(current_path).to eq("/users/#{user1.id}/discover")
    end

    it 'has text field to search key words then redirects to matching list', :vcr do
        @user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{@user1.id}/discover"
        expect(page).to have_button("Search")

        fill_in :search, with: 'Shawshank Redemption'
        click_on "Search"
        expect(page).to have_content("Shawshank Redemption")
        expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end
end
