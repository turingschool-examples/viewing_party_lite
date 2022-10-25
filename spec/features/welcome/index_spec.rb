require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do
  describe 'index page' do
    before :each do 
      @user_1 = create(:user)
      @user_2 = create(:user)

      visit login_path
      fill_in 'Email', with: "#{@user_1.email}"
      fill_in 'Password', with: "#{@user_1.password}"
      click_button "Submit"
    end

    it 'has the title of the application' do
      visit root_path
      expect(page).to have_content('Viewing Party Lite')
    end

    it 'has a button to create a new user' do
      visit root_path
      expect(page).to have_button('Create a New User')
      click_button('Create a New User')
      expect(page).to have_current_path(new_register_path)
    end

    it 'has a link to return to landing page' do
      visit root_path
      expect(page).to have_content('Existing Users')

      within '#user-0' do
        expect(page).to have_content("#{@user_1.name}")
        expect(page).to_not have_content("#{@user_2.name}")
      end

      within '#user-1' do
        expect(page).to have_content("#{@user_2.name}")
        expect(page).to_not have_content("#{@user_1.name}")
      end
    end

    it 'each existing user links to user dashboard' do
      visit root_path
      
      click_link("#{@user_1.name}'s Dashboard")
      expect(current_path).to eq(dashboard_path)
    end
  end
end
