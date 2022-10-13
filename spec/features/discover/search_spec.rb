# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Discover Movies Page' do
  describe 'As a user when I visit the discover movies page' do
    it 'has a Discover Movies header' do
      @alex = user = create(:user)

      visit user_discover_path(@alex)

      expect(page).to have_content('Discover Movies')
    end

    it 'should have a button for top rated movies' do
      user = create(:user)

      visit user_discover_path(user)

      expect(page).to have_button("Top Rated Movies")
    end

    it 'current_path should have a section for top rated movies' do
      VCR.use_cassette('top_40_movies') do
        user = create(:user)

        visit user_discover_path(user)
        expect(page).to_not have_css("#top_40_movies")

        click_button "Top Rated Movies"
        expect(page).to have_css("#top_40_movies")
      end
    end

    it 'has a search bar' do
      VCR.use_cassette('search') do
        user = create(:user)

        visit user_discover_path(user)
        expect(page).to have_button('Find Movies')

        page.fill_in with: "fight cLub"
        click_button 'Find Movies'
        expect(current_path).to eq user_discover_path(user)
        expect(page).to have_content "Fight Club"
      end
    end

  end
end
