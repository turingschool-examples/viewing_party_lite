require 'rails_helper'

RSpec.describe 'the Discover Movies Page', type: :feature do
  let!(:user_1) { create(:user) }
  before(:each) do
    visit user_discover_index_path(user_1)
  end

  describe 'When I visit the user discover path' do
    it 'I see a button to Discover Top Rated Movies that takes me to the movies results page' do
      within "#top-rated" do
        click_button 'Find Top Rated Movies'
      end
      
      expect(current_path).to eq(user_movies_path(user_1))
    end

    it 'I see a text field to enter keyword(s) and a button to search by movie title that takes me to the movies results page' do
      within "#find-movie" do
        fill_in :search, with: 'princess'

        click_button 'Find Movies'
      end

      expect(current_path).to eq(user_movies_path(user_1))
    end
  end
end