require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do
  describe 'index page' do
    before :each do 
      @user_1 = create(:user)
      @user_2 = create(:user)
    end

    it 'has the title of the application' do
      visit root_path
      expect(page).to have_content('Viewing Party Lite')
    end

    it 'has a button to create a new user' do
      visit root_path
      expect(page).to have_button('Create an Account')
      click_button('Create an Account')
      expect(page).to have_current_path(new_register_path)
    end

    it 'has a section for existing users where each users name is a link' do
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

    xit 'each existing user links to user dashboard' do
      visit root_path
      
      click_link("#{@user_1.name}'s Dashboard")
      expect(current_path).to eq(dashboard_path)
    end
  end
end
