require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  before(:each) do
    @user = create(:user)

    visit user_movie_path(@user.id, 238)
  end

  describe 'Movies#show' do
    it 'has a button back to Discover Movies', :vcr do
      expect(page).to have_link('Discover Movies')
      click_link 'Discover Movies'
      expect(current_path).to eq("/users/#{@user.id}/discover")
    end

    it 'has a button to Create Viewing Party', :vcr do
      expect(page).to have_link('Create Viewing Party')
      click_link 'Create Viewing Party'
      expect(current_path).to eq("/users/#{@user.id}/movies/238/parties/new")
    end

    it 'has details for the movie on display', :vcr do
      expect(page).to have_content('The Godfather')
      expect(page).to have_content('Vote average:')
    end
  end
end
