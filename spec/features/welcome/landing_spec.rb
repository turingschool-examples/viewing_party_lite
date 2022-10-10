require 'rails_helper'

RSpec.describe 'landing page' do

  describe 'when I visit the landing page' do
    before(:each) do
      visit '/'
    end

    it 'displays the title of the application' do
      expect(page).to have_content "Viewing Party"
    end

    it 'has a button to create a new user' do
      expect(page).to have_button "Create a New User"

      click_on "Create a New User"
      
      expect(page).to have_current_path new_user_path
    end

    xit 'displays a list of all current users' do
      #implement faker / factory_bot to create a users
      expect(page).to have_content
    end

    it 'links back to landing page' do
      expect(page).to have_link("Home")

      click_on "Home"

      expect(page).to have_current_path(root_path)
    end
  end
end