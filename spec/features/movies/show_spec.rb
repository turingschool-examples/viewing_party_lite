require 'rails_helper'

RSpec.describe 'Movie Show Page', type: :feature do
    before :each do
        @user = User.create!(name: 'Badger', email: 'honey@gmail.com')
        visit user_movie_path(@user.id, 278)
    end
    
    it "has a button to create a viewing party" do
        click_button "Create Viewing Party"
        expect(current_path).to eq(new_user_movie_viewing_party_path(@user.id,278)) 
    end
    
    it "has a button to return to discover page" do
        click_button "Discover Movies"
        expect(current_path).to eq(user_discover_index_path(@user.id)) 
    end

    it "displays all of movie details and reviews" do
        expect(page).to have_content("Title: The Shawshank Redemption") 
        expect(page).to have_content("Average Vote: 8.7") 
        expect(page).to have_content("Runtime: 2 h 22 min") 
        expect(page).to have_content("Genres: Drama Crime") 
        expect(page).to have_content("Summary: Framed in the") 
        expect(page).to have_content("Andy Dufresne") 
        expect(page).to have_content("Morgan Freeman") 
        expect(page).to have_content("Total Reviews: 7") 
        expect(page).to have_content("Author: elshaarawy") 
        expect(page).to have_content("Review: very good movie") 
        expect(page).to_not have_content("Lord of the Rings") 
    end
    
    
end