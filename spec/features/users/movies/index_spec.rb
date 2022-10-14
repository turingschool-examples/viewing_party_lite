require 'rails_helper'

RSpec.describe 'Movie results page' do
  describe 'When discover top rated movies is clicked' do
    it 'displays the 20 top rated movies' do
      user = create(:user)

      visit user_discover_index_path(user)

      VCR.use_cassette('top_rated_movies_index') do
        click_button 'Discover Top Rated Movies'
        movies = MoviesFacade.top_rated
        expect(current_path).to eq(user_movies_path(user))
        expect(page).to have_content(movies.first.title)
        expect(page).to have_content(movies.first.vote_average)
        expect(page).to have_content(movies.last.title)
        expect(page).to have_content(movies.last.vote_average)
        expect(page).to have_link("#{movies.first.title}")
        click_link "#{movies.first.title}"
        expect(page).to have_current_path user_movie_path(user, movies.first.id)
      end
    end
  end

  describe 'When a movie title is searched' do
    it 'displays up to 40 results from the search' do
      user = create(:user)

      visit user_discover_index_path(user)

      VCR.use_cassette('search_top_gun_feature') do
        fill_in 'Search', with: 'Top Gun'
        click_on 'Search by Movie Title'
        movies = MoviesFacade.search('Top Gun')
        expect(current_path).to eq(user_movies_path(user))
        expect(page).to have_content('Top Gun')
        expect(page).to have_link movies.first.title
        click_on movies.first.title
        expect(current_path).to eq(user_movie_path(user, movies.first.id))
      end
    end

    it 'will return nothing if a movie title has no match', :vcr do
      user = create(:user)

      visit user_discover_index_path(user)

      fill_in 'Search', with: 'Top Gun 17'
      click_on 'Search by Movie Title'

      expect(current_path).to_not have_content('Top Gun')
    end
  end
end
