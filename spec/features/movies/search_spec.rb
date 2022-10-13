require 'rails_helper'

RSpec.describe 'Movie Search Page' do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
  end
  # As an user,
  # When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
  # I should see

  # Button to Discover Top Rated Movies
  # A text field to enter keyword(s) to search by movie title
  # A Button to Search by Movie Title
  # Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.
  describe 'When I visit the /users/:id/discover path' do
    it 'I should see button to Find Top Rated Movies' do
      visit user_discover_path(@user_1)

      click_button 'Find Top Rated Movies'

      visit user_discover_path(@user_2)

      click_button 'Find Top Rated Movies'
    end

    it 'A text field to enter keyword(s) to search by movie title' do
      visit user_discover_path(@user_1)

      fill_in 'Search movies', with: 'Dark Knight'
      click_on 'Find Movies'

      visit user_discover_path(@user_2)

      fill_in 'Search movies', with: 'Killer Clowns From Outer Space'
      click_on 'Find Movies'
    end
  end
end
