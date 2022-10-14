require 'rails_helper'

RSpec.describe 'the users discover index' do
  describe 'When I visit the users discover path' do
    let!(:user) { create :user }
    before :each do
      visit user_discover_index_path(user)
    end

    it 'has a button to discover top rated movies' do
      expect(page).to have_button('Discover Top Rated Movies')
    end

    it 'has a text field to enter a search by movie title' do
      expect(page).to have_field('Search')
    end

    it 'has a button to search by movie title' do
      expect(page).to have_button('Search by Movie Title')
    end

    describe 'When I click on the top rated movies' do
      it 'redirects to the movies results page' do
        VCR.use_cassette('top_rated_movies') do
          click_button 'Discover Top Rated Movies'
          expect(current_path).to eq(user_movies_path(user))
        end
      end
    end

    describe 'When I click on the search button' do
      it 'redirects to the movies results page' do
        VCR.use_cassette('search_Minions') do
          fill_in 'Search', with: 'Minions'
          click_button 'Search by Movie Title'
          expect(current_path).to eq(user_movies_path(user))
        end
      end
    end
  end
end
