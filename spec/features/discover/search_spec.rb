# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Discover Movies Page' do
  describe 'As a user when I visit the discover movies page' do
    it 'has a Discover Movies header' do
      @alex = User.create!(user_name: 'Alex', email: Faker::Internet.email,
                           password_digest: Faker::Internet.password)
      visit user_discover_path(@alex)

      expect(page).to have_content('Discover Movies')
    end

    it 'should have a button for top rated movies' do
      user = create(:user)

      visit user_discover_path(user)

      expect(page).to have_button("Top Rated Movies")
    end

    it 'current_path should be ' do
      user = create(:user)

      visit user_discover_path(user)

      click_button "Top Rated Movies"
    end
  end
end
