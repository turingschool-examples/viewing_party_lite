require 'rails_helper'


RSpec.describe 'user movies index page', :vcr do 
    it "has a button to find top rated movies" do 
        user_1 = User.create!(name: "ODB", email: "testemail3@mail.com")
        visit "/users/#{user_1.id}/discover"
        click_on("Find Top Rated Movies")
        expect(current_path).to eq("/users/#{user_1.id}/movies")
        expect(page).to have_content("Top Movies")
        expect(page).to have_content("Shawshank Redemption")
        expect(page).to have_no_content("Paul Blart")
        expect(page).to have_no_content("Movie results for: ")

    end

    it "can show the results for a specific search" do 
        user_1 = User.create!(name: "ODB", email: "testemail3@mail.com")
        visit "/users/#{user_1.id}/discover"
        fill_in :search, with: 'Phoenix'
        click_button 'Search'
        expect(current_path).to eq("/users/#{user_1.id}/search")
        expect(page).to have_content("Dark Phoenix")
        expect(page).to have_no_content("Paul Blart")
        expect(page).to have_content("Movie results for: ")
        expect(page).to have_no_content("Top Movies")
    end

    it "has a link to return to discover movies" do 
        user_1 = User.create!(name: "ODB", email: "testemail3@mail.com")
        visit "/users/#{user_1.id}/discover"
        fill_in :search, with: 'Phoenix'
        click_button 'Search'
        expect(current_path).to eq("/users/#{user_1.id}/search")
        click_button "Discover Page"
        expect(current_path).to eq("/users/#{user_1.id}/discover")
    end

end