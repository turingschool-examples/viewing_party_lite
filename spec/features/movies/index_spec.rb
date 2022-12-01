# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the Movies Index Page', type: :feature do
  let!(:user_1) { create(:user) }
  let!(:movie_1) do
    Movie.new(id: 238, title: 'The Godfather', vote_average: 8.7, overview: 'spanning the years of...', runtime: 175,
              genres: 'drama')
  end

  before(:each) do
    VCR.insert_cassette 'top rated'
    visit "/users/#{user_1.id}/discover"
    click_button 'Find Top Rated Movies'
  end
  after(:each) do
    VCR.eject_cassette
  end

  describe 'After clicking the Top Movies button or Search button to lead me to the movies index page' do
    it 'I should see the movie title as a link to the movie details page and the vote average' do
      expect(page.status_code).to eq 200
      expect(current_path).to eq(user_movies_path(user_1))

      within '#movie-results' do
        expect(page).to have_content(movie_1.title)
        expect(page).to have_content(movie_1.vote_average)
      end
    end

    it 'should have a maximum of 20 movie results' do
      expect(page).to have_css('.results', count: 20)
    end

    it 'I see a button that takes me back to the Discover Page' do
      click_button 'Discover Page'

      expect(current_path).to eq("/users/#{user_1.id}/discover")
    end
  end
end
