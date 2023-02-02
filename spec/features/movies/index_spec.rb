require 'rails_helper'

RSpec.describe 'movie index' do
  before :each do
    @user1 = create(:user)
    @top_movies = MovieFacade.top_rated
  end

  describe 'when i visit users/:user_id/movies' do
    it 'has the title as a link to the movie details page' do
      visit user_discover_index_path(@user1)

      click_button 'Top Rated Movies'
      
      expect(current_path).to eq user_movies_path(@user1)
      expect(page).to have_link('The Godfather')
      expect(page).to have_link('The Shawshank Redemption')
      expect(page).to have_link('The Godfather Part II')
      expect(page).to_not have_link('Air bud')
    end

    it 'has the title as a link to the movie details page' do
      visit user_discover_index_path(@user1)

      fill_in 'Search', with: 'Air'
      click_button 'Search'

      expect(current_path).to eq user_movies_path(@user1)
      expect(page).to have_link('Con Air')
      expect(page).to have_link('Air Bud')
      expect(page).to have_link('Air Force One')
      expect(page).to_not have_link('The Godfather')
    end

    it 'has the vote average for the movie' do
      visit user_discover_index_path(@user1)

      click_button 'Top Rated Movies'
      
      expect(page).to have_content('vote average: 8.7')
      expect(page).to have_content('vote average: 8.6')
    end

    it 'has a button to return to the discover page' do
      visit user_discover_index_path(@user1)

      click_button 'Top Rated Movies'

      expect(page).to have_button 'Discover Page'
    end
  end
end