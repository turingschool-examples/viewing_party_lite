require 'rails_helper'
require 'faker'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
    @user = create(:user)

    visit "/users/#{@user.id}/discover"
  end

  describe 'index' do
    it 'has a link to discover top rated movies that links to movies results page', :vcr do
      expect(page).to have_link('Discover Top Rated Movies')
      click_link('Discover Top Rated Movies')
      expect(current_path).to eq("/users/#{@user.id}/movies")
      expect(page.status_code).to eq(200)
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("Vote average: ")
    end

    it 'has a search bar that links to movies results page' do
      VCR.use_cassette('up_movie_search') do
        fill_in "search",	with: "Up"
        click_button 'Find Movies'

        expect(page.status_code).to eq(200)
      end
    end

    it 'will not search for movies without valid search term(s)' do
      fill_in "search",	with: ""
      click_button 'Find Movies'

      expect(current_path).to eq("/users/#{@user.id}/discover")
    end
  end
end
