# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Movie Results Page' do
  describe 'user visits the movie results page after pressing Top Movies' do
    it 'shows to movies details - title as a link to movie details, and vote avg per movie', :vcr do
      @user_1 = create(:user)

      visit user_discover_index_path(@user_1)

      click_button 'Top Rated Movies'

      expect(current_path).to eq(user_movies_path(@user_1))
      expect(page).to have_content('Top Rated Movies')
      expect(page).to have_content('Vote Average:')
      expect(page).to have_content('The Godfather')
      # click_link "The Hobbit"
      # expect(current_path).to eq() ##don't know how to send movie id to test it goes to movie details page
    end
  end

  describe 'user visits the movie results page after searching with a keyword' do
    it 'displays the search results and their avg ratings' do
      @user_1 = create(:user)

      visit user_discover_index_path(@user_1)

      fill_in 'Search by movie title', with: 'Jack'

      click_button 'Find Movies'
      expect(current_path).to eq(user_movies_path(@user_1))
      expect(page).to have_content('Movie Results for:')
      expect(page).to have_content('Vote Average:')
      expect(page).to have_content('Jack Reacher')
    end
  end
end
