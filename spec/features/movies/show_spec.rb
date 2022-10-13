# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Detail Page' do
  describe 'As a user when I visit the Movies Detail (show) Page', :vcr do
    before(:each) do
      @user1 = User.create!(name: 'Micheal Jordan', email: 'user7@gmail.com')
      visit user_movie_path(@user1, 19404)
    end
    it 'has movie details' do
      expect(page).to have_content('Dilwale Dulhania Le Jayenge')
      expect(page).to have_content('Vote Average: 8.5')
      expect(page).to have_content('Comedy')
      expect(page).to have_content('Drama')
      expect(page).to have_content('Romance')
      expect(page).to have_content('Runtime: 3 hours and 10 minutes')
      expect(page).to have_content('Raj is a rich, carefree,')
      expect(page).to have_content('Cast Members:')
      expect(page).to have_content('Total Reviews:')
    end
    it 'has button to create viewing party/redirects to new form' do
      expect(page).to have_button('Create Viewing Party')
      click_on 'Create Viewing Party'
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 19404))
    end
    it 'has button to return to discover page' do
      expect(page).to have_button('Discover Movies')
    end
  end
end
