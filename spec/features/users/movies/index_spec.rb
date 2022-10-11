require 'rails_helper'

RSpec.describe 'Movie results page' do
  describe 'When discover top rated movies is clicked' do
    it 'displays the 20 top rated movies' do
      user = create(:user)

      visit user_discover_index_path(user)

      VCR.use_cassette('top_rated_movies') do
        click_button "Discover Top Rated Movies"
        movies = MoviesFacade.top_rated
      
        expect(current_path).to eq(user_movies_path(user))
        expect(page).to have_content(movies.first.title)
        expect(page).to have_content(movies.first.vote_average)
        expect(page).to have_content(movies.last.title)
        expect(page).to have_content(movies.last.vote_average)
      end
    end
  end

  describe 'When a movie title is searched'
end