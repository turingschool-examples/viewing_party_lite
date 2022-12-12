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

    it 'I see a list of existing users which links to the users dashboard' do
      within '#existing_users' do
        expect(page).to have_content(user_1.email)
        expect(page).to have_content(user_2.email)
        expect(page).to have_content(user_3.email)

        click_link user_1.email
      end

      expect(page).to have_current_path(user_path(user_1), ignore_query: true)
    end

    it 'I see a link to go back to the landing page' do
      click_link 'Home'

      expect(page).to have_current_path(root_path, ignore_query: true)
    end

    it 'I see a link to log in and when clicked I am taken to a Log in page where I can input email and password' do
      click_link 'Log In'
      expect(page).to have_current_path('/login')

      user = create(:user, email: 'user@test.com', password: 'test123', password_confirmation: 'test123')
      within '#login' do
        fill_in :email, with: 'user@test.com'
        fill_in :password, with: 'test123'
      end
    end
  end
end
