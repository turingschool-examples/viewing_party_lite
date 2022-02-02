require 'rails_helper'

RSpec.describe 'Discover Movies Page', :vcr do
  let(:user) { create :user }

  before do
    visit user_discover_index_path(user)
  end

  describe 'user visits "/users/:id/discover" path, where :id, is the id of a valid user'
    it 'displays a button to Find Top Rated Movies' do
      expect(page).to have_button("Find Top Rated Movies")

      click_button "Find Top Rated Movies"
      expect(current_path).to eq(user_movies_path(user))
    end

    xit 'displays a search field and button to search keywords for movie title' do
    end
  end




# As an authenticated user,
# When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
# I should see
#
#  Button to Discover Top Rated Movies
#  A text field to enter keyword(s) to search by movie title
#  A Button to Search by Movie Title
# Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.
#
# The movies will be retrieved by consuming The MovieDB API
