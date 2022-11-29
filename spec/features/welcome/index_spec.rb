require 'rails_helper'

RSpec.describe 'the Welcome Page', type: :feature do
  describe 'When I visit the welcome page' do
    it 'I see the title of the application' do
      visit root_path

      expect(page).to have_content('Viewing Party')
    end

    it 'I see a button to create a new user' do
      visit root_path

      click_button 'Create a New User'

      expect(current_path).to eq(register_path)
    end

    xit 'I see a list of existing users which links to the users dashboard' do
      visit root_path

      within "#existing-users" do
        expect(page).to have()
      end
    end

    it 'I see a link to go back to the landing page' do
      visit root_path

      click_link 'Home'

      expect(current_path).to eq(root_path)
    end
  end
end