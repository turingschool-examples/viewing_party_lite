# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie results page' do
  describe 'When discover top rated movies is clicked' do
    let!(:user) { create :user }
    before :each do
      visit login_path
      
      fill_in 'Email', with: "#{user.email}"
      fill_in 'Password', with: "#{user.password}"

      click_button 'Log In'

      visit discover_path
    end

    it 'displays the 20 top rated movies' do
      VCR.use_cassette('top_rated_movies_index') do
        click_button 'Discover Top Rated Movies'
        movies = MoviesFacade.top_rated
        movie = movies.first

        expect(current_path).to eq(movies_path)
        expect(page).to have_content(movie.title)
        expect(page).to have_content(movie.vote_average)
        expect(page).to have_content(movies.last.title)
        expect(page).to have_content(movies.last.vote_average)
        expect(page).to have_link(movies.first.title.to_s)

        click_link "#{movie.title}"

        expect(current_path).to eq(movie_path(movie.id))
      end
    end

    describe 'When a movie title is searched' do
      it 'displays up to 40 results from the search', :vcr do
        fill_in 'Search', with: 'Top Gun'
        click_on 'Search by Movie Title'

        movies = MoviesFacade.search('Top Gun')
        movie = movies.first

        expect(current_path).to eq(movies_path)
        expect(page).to have_content('Top Gun')
        expect(page).to have_link movie.title

        click_on "#{movie.title}"

        expect(current_path).to eq(movie_path(movie.id))
      end

      it 'will return nothing if a movie title has no match', :vcr do  
        fill_in 'Search', with: 'Top Gun 17'
        click_on 'Search by Movie Title'

        expect(current_path).to_not have_content('Top Gun')
      end
    end
  end
end