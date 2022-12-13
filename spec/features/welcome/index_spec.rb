# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The Welcome Page', type: :feature do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }

  before do
    visit root_path
  end

  describe 'When I visit the welcome page' do
    it 'I see the title of the application' do
      expect(page).to have_content('Viewing Party')
    end

    it 'I see a button to create a new user' do
      click_button 'Create a New User'

      expect(page).to have_current_path(register_path, ignore_query: true)
    end

    it 'I see a link to go back to the landing page' do
      click_link 'Home'

      expect(page).to have_current_path(root_path, ignore_query: true)
    end

    it 'I see a link to log in and when clicked I am taken to a Log in page' do
      click_link 'Log In'
      expect(page).to have_current_path('/login')
    end
  end
end
