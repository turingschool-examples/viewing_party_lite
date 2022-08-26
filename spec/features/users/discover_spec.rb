require 'rails_helper'

RSpec.describe "User Discover Movie", type: :feature do
    it 'has a button to discover top rated movies', :vcr do
        @user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{@user1.id}/discover"
        expect(page).to have_button("Discover Top Rated Movies")
        
        
        click_button "Discover Top Rated Movies"
        expect(current_path).to eq("/users/#{@user1.id}/movies")
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

# As an user,
# When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
# I should see

#  Button to Discover Top Rated Movies
#  A text field to enter keyword(s) to search by movie title
#  A Button to Search by Movie Title
#  Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.
# The movies will be retrieved by consuming The MovieDB API
