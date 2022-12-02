require 'rails_helper'

RSpec.describe 'movies show page' do
  let!(:user1) { create(:user) }

  before :each do
    visit user_movie_path(user1, 238)
  end

  describe 'The Godfather show page', :vcr do
    it 'has the movie title' do
      expect(page).to have_content('The Godfather')
    end

    it 'has button to return to show page' do
      expect(page).to have_button('Discover Page')
    end

    it 'has button to create viewing party for current movie' do
      expect(page).to have_button('Create Viewing Party for The Godfather')
      expect(page).to_not have_button('Create Viewing Party for Suicide Squad')
    end

    it 'has details of current movie (The Godfather)' do
      expect(page).to have_content('Vote: 8.7')
      expect(page).to have_content('Runtime:')
      expect(page).to have_content('Genre:')
      expect(page).to have_content('Summary:')
      expect(page).to have_content('Cast:')
      expect(page).to have_content('Reviews:')
    end
  end
end
