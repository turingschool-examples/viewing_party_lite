require 'rails_helper'

RSpec.describe 'discover page', type: :feature do
  let!(:u1) { create(:user) }

  describe "when I visit '/users/:id/discover', it" do
    it 'has a button to display Top Rated Movies' do
      visit discover_user_path(u1)

      expect(page).to have_button('Discover Top Rated Movies')

      click_button 'Discover Top Rated Movies'

      expect(current_path).to eq(user_movies_path(u1))
    end

    it 'has a test form to search by movie title' do
      visit discover_user_path(u1)

      expect(page).to have_field('title')
      expect(page).to have_button('Search By Movie Title')

      click_button 'Search By Movie Title'

      expect(current_path).to eq(user_movies_path(u1))
    end
  end
end
