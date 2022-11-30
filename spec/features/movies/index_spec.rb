require 'rails_helper'

RSpec.describe 'the Movies Index Page', type: :feature do
  let!(:user_1) { create(:user) }
  before(:each) do
    visit "/users/#{user_1.id}/discover"
    click_button 'Find Top Rated Movies'
  end

  describe 'After clicking the Top Movies button or Search button to lead me to the movies index page' do
    it 'I should see the movie title as a link to the movie details page and the vote average' do
      expect(current_path).to eq(user_movies_path(user_1))

      within "#movie-results" do
        expect(page).to have_content("The Godfather")
        expect(page).to have_content("8.7")
      end
    end

    it 'I see a button that takes me back to the Discover Page' do
      click_button 'Discover Page'

      expect(current_path).to eq("/users/#{user_1.id}/discover")
    end
  end
end