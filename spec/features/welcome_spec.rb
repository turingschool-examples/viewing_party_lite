require 'rails_helper'

RSpec.describe 'Welcomes', type: :feature do
  describe 'GET /' do
    it 'displays welcome to Viewing Party Lite' do
      visit root_path

      expect(page).to have_content('Welcome to Viewing Party Lite!')
      expect(page).to have_link 'New User'
      expect(page).to have_link 'Existing Users'
      expect(page).to have_link 'Welcome Page'
    end

    it 'has links to user index page' do
      visit root_path
      click_link 'Existing Users'

      expect(current_path).to eq users_path
    end

    it 'has button to new user page' do
      visit root_path

      click_on 'New User'

      expect(current_path).to eq new_user_path
    end
  end
end
