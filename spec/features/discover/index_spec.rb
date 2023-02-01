require 'rails_helper'

RSpec.describe 'discover index page' do
  before(:each) do
    @user1 = create(:user)
    
    visit user_discover_index_path(@user1)
  end

  describe 'When I visit the \'/users/:id/discover\' path' do
    it 'has a button to Discover Top Rated Movies' do
      expect(page).to have_button('Top Rated Movies')
    end

    it 'has a text field to enter keyword search for movies' do
      expect(page).to have_field('Search')
    end

    it 'has a search button' do
      expect(page).to have_button('Search')
    end

    it 'top rated button routes to results page /users/:user_id/movies' do
      click_button('Top Rated Movies')

      expect(current_path).to eq(user_movies_path(@user1))
    end

    it 'search field submit button routes to results page /users/:user_id/movies' do
      click_button('Search')

      expect(current_path).to eq(user_movies_path(@user1))
    end
  end
end
