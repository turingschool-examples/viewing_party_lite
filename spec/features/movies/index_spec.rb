# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the movies result page' do
  describe 'layout' do
    before(:each) do
      @user1 = create(:user)

      VCR.use_cassette('top_rated_movies') do
        visit "/discover"
        click_button 'Discover Top Rated Movies'
      end
    end

    it 'has a button to return to the discover page' do
      click_button 'Discover Page'
      expect(current_path).to eq(discover_index_path)
    end
  end

  describe 'top rated movies' do
    before(:each) do
      VCR.use_cassette('top_rated_movies') do
        movies = MoviesService.top_rated_movies
        @first_movie = movies[:results].first
        @last_movie = movies[:results].last
      end

      @user1 = create(:user)

      VCR.use_cassette('top_rated_movies') do
        visit "/discover"
        click_button 'Discover Top Rated Movies'
      end
    end

    it 'i see the movie title as a link to the movie details page and the vote average of the movie' do
      within '#movies' do
        expect(page).to have_link(@first_movie[:title])
        expect(page).to have_content(@first_movie[:vote_average])

        expect(page).to have_link(@last_movie[:title])
        expect(page).to have_content(@last_movie[:vote_average])
      end
    end
  end

  describe 'movie search' do
    before(:each) do
      VCR.use_cassette('search_godfather') do
        movies = MoviesService.search('godfather')
        @first_movie = movies[:results].first
        @last_movie = movies[:results].last
      end

      @user1 = create(:user)

      VCR.use_cassette('search_godfather') do
        visit "/discover"
        fill_in 'Search', with: 'godfather'
        click_button 'Search by Movie Title'
      end
    end

    it 'i see the movie title as a link to the movie details page and the vote average of the movie' do
      within '#movies' do
        expect(page).to have_link(@first_movie[:title])
        expect(page).to have_content(@first_movie[:vote_average])

        expect(page).to have_link(@last_movie[:title])
        expect(page).to have_content(@last_movie[:vote_average])
      end
    end

    it 'displays search query' do
      expect(page).to have_content('Movie results for: "godfather"')
    end

    it 'displays no results found if search unsuccessful' do
      VCR.use_cassette('no_results_search') do
        visit "/discover"
        fill_in 'Search', with: '1098236'
        click_button 'Search by Movie Title'
      end

      expect(page).to have_content('No Results Found')
    end
  end
end
