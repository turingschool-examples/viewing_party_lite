# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User | Discover', type: :feature do
  describe 'When I visit /users/:id/discover;', :vcr do
    before(:each) do
      @user1 = User.create!(name: 'Micheal Jordan', email: 'user235@gmail.com')
      visit user_discover_index_path(@user1)
    end
    it 'I see a button to discover top rated movies' do
      expect(page).to have_button('Discover Top Rated Movies')

      click_button 'Discover Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user1))
    end

    it 'has text field to search key words then redirects to matching list' do
      expect(page).to have_button('Search')

      fill_in :search, with: 'Shawshank Redemption'
      click_on 'Search'

      expect(page).to have_content('Shawshank Redemption')
      expect(current_path).to eq(user_movies_path(@user1))
    end
  end
end
