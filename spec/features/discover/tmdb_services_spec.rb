require 'rails_helper'
require 'faker'

RSpec.describe 'TMDB Search' do
  before(:each) do
    @user = create(:user)
    visit user_discover_index_path(@user.id)
  end

  describe 'happy path' do
    it 'allows users to search for top rated movies', :vcr do
      click_link 'Discover Top Rated Movies'

      expect(page.status_code).to eq(200)
      expect(page).to have_content('Godfather')
    end

    it 'returns results for a movie search by keyword', :vcr do
      fill_in "search",	with: "Up"
      click_button 'Find Movies'
      expect(page).to have_content("Up")
    end

    it 'can grab a specific movie', :vcr do
      visit "/users/#{@user.id}/movies"
      click_link 'The Godfather'
      expect(page).to have_content('Title')
      expect(page).to have_content('The Godfather')
    end
  end
end
