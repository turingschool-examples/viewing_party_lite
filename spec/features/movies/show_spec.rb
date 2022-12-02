require 'rails_helper'

RSpec.describe 'movies show page' do
  let!(:user1) { create(:user) }

  before :each do
    visit user_movie_path(user1, 238)
  end

  describe 'The Godfather show page' do
    it 'has the movie title', :vcr do
      expect(page).to have_content('The Godfather')
    end
  end
end
