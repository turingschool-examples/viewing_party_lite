require 'rails_helper'

RSpec.describe 'Discover Movies Page' do #, :vcr do
  let(:user) { create :user }

  before do
    visit user_discover_index_path(user)
  end

  describe 'user visits "/users/:id/discover" path, where :id, is the id of a valid user' do
    it 'displays a button to Find Top Rated Movies' do
      VCR.use_cassette('top_rated_movies') do
      expect(page).to have_button("Find Top Rated Movies")

      click_button "Find Top Rated Movies"
      expect(current_path).to eq(user_movies_path(user))
      expect(status_code).to eq(200)
    end
    end

    it 'displays a search field and button to search keywords for movie title' do
      VCR.use_cassette('keyword_search_result_fight') do
      expect(page).to have_button('Search Movie By Keyword')

      fill_in :q, with: 'fight'
      click_button 'Search Movie By Keyword'
      # save_and_open_page
      expect(current_path).to eq(user_movies_path(user))
      expect(status_code).to eq(200)
      expect(page).to have_content('Fight Club')
    end
    end
  end
end




# As an authenticated user,
# do we need to authenticate the user
# When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
# I should see
#
#  Button to Discover Top Rated Movies
#  A text field to enter keyword(s) to search by movie title
#  A Button to Search by Movie Title
# Details When the user clicks on the Top Rated Movies OR the search button,
# they should be taken to the movies results page (more details of this on the
# Movies Results Page issue.
#
# The movies will be retrieved by consuming The MovieDB API
