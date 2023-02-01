require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  describe 'movie results ' do

    let!(:user) { create(:user) }

    before :each do
      visit user_movie_path 
    end

    it 'displays only up to 20 movies' do
      expect(movies.length).to be <= 20
    end

    it 'has a button to return to the discover page' do
      expect(page).to have_button "Discover Page"

      click_button "Discover Page"

      expect(current_path).to eq discover_user_path
    end

    describe 'it can display movies from a top movies request' do
      it 'displays each movies title and vote avg' do
        movies.each do |movie|
          within "#movie_#{movie_id}" do
            expect(page).to have_content(movie.title)
            expect(page).to have_content(movie.vote_average) 
          end
        end
      end
    end
  end
end
