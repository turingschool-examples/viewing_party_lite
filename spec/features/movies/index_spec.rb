require 'rails_helper'

RSpec.describe 'movie index' do
  before :each do
    @user1 = create(:user)
  end

  describe 'when i visit users/:user_id/movies' do
    it 'has the title as a link to the movie details page' do
      visit user_discover_index_path(@user1)

      click_button 'Top Rated Movies'
      
      expect(current_path).to eq user_movies_path(@user1)
      expect(page).to have_link('The Godfather')
      expect(page).to have_link('The Shawshank Redemtion')
      expect(page).to have_link('The Godfather Part II')
      expect(page).to_not have_link('Air bud')
    end

    xit 'has the title as a link to the movie details page' do
      visit user_discover_index_path(@user1)

      fill_in :search, with: 'Air'
      click_button 'Search'

      expect(current_path).to eq user_movies_path(@user1)
      expect(page).to have_link('Con Air')
      expect(page).to have_link('Air Bud')
      expect(page).to have_link('Air Force One')
      expect(page).to_not have_link('The Godfather')
    end
  end
end