# When I visit the discover movies page,
# and click on either the Top Movies button or the Search button,
# I should be taken to the movies results page (users/:user_id/movies) where I see:

# Title (As a Link to the Movie Details page)
# Vote Average of the movie
# Details: There should only be a maximum of 20 results. The above details should be listed for each movie.

# I should also see a button to return to the Discover Page.
require 'rails_helper'

RSpec.describe "Discover Page" do
  describe "As a User" do
    describe "When I visit the discover movies page" do
      it "I see button to for Top Movies and a button for Search with the option to input a keyword" do
        user1 = create(:user)

        visit "/users/#{user1.id}/discover"
        # save_and_open_page
        expect(page).to have_link("Home")
        expect(page).to have_content("Viewing Party Lite")
        expect(page).to have_content("Discover Movies")
        expect(page).to have_button("Find Top Rated Movies")
        expect(page).to have_field("Search")
        expect(page).to have_button("Find Movies")
      end

      it "has top movies button that redirects to movie results page" do 
        user1 = create(:user)
        visit "/users/#{user1.id}/discover"
        
        click_button "Find Top Rated Movies"
        save_and_open_page
        expect(current_path).to eq("/users/#{user1.id}/movies")
      end
    end
  end
end
