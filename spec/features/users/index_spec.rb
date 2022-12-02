# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the Discover Movies Page', type: :feature do
  let!(:user_1) { create(:user) }

  before do
    visit "/users/#{user_1.id}/discover"
  end

  after do
    VCR.eject_cassette
  end

  describe 'When I visit the user discover path' do
    it 'I see a button to Discover Top Rated Movies that takes me to the movies results page' do
      VCR.insert_cassette 'top rated'
      visit "/users/#{user_1.id}/discover"

      within '#top-rated' do
        click_button 'Find Top Rated Movies'
      end

      expect(page.status_code).to eq 200
      expect(page).to have_current_path(user_movies_path(user_1), ignore_query: true)
    end

    it 'I see a text field to enter keyword(s) and a button to search by movie title that takes me to the movies results page' do
      VCR.insert_cassette 'searches'
      visit "/users/#{user_1.id}/discover"

      within '#find-movie' do
        fill_in :search, with: 'princess'

        click_button 'Find Movies'
      end

      expect(page.status_code).to eq 200
      expect(page).to have_current_path(user_movies_path(user_1), ignore_query: true)
    end
  end
end
