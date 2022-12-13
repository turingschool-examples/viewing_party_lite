# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the movie discover page' do
  before(:each) do
    @user = create(:user)

    visit "users/#{@user.id}/discover"
  end

  it 'has a button to discover top rated movies' do
    VCR.use_cassette('top_rated_movies') do
      click_button 'Discover Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user))
    end
  end

  it 'has a search field to search by a movie title' do
    VCR.use_cassette('search_godfather') do
      expect(page).to have_field('Search')
      fill_in 'Search', with: 'godfather'

      click_button 'Search by Movie Title'
      expect(current_path).to eq(user_movies_path(@user))
    end
  end

  describe 'sad paths' do
    it 'returns to discover page with error message if left blank' do
      click_button 'Search by Movie Title'
      expect(current_path).to eq(user_discover_index_path(@user))
      expect(page).to have_content("Error: Search field can't be blank")
    end
  end
end
