require 'rails_helper'

RSpec.describe 'Discover Page', type: :feature do
    it "has button for Top Rated Movies" do
        user = User.create!(name: 'Badger', email: 'honey.new@gmail.com')
        visit user_discover_index_path(user.id)
        click_button 'Top Rated Movies'
        expect(current_path).to eq(user_movies_path(user.id)) 
    end

    it "has text field / button to search by keywords" do
        user = User.create!(name: 'Badger', email: 'honey.new@gmail.com')
        visit user_discover_index_path(user.id)
        fill_in :search, with: 'Rings'
        click_button 'Search'
        expect(current_path).to eq(user_movies_path(user.id)) 
        expect(page).to have_content("Lord of the Rings: The Return of the King")
    end
end
