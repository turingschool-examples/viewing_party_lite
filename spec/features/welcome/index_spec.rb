require 'rails_helper'

RSpec.describe 'The Welcome Page', type: :feature do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }
  before(:each) do
    visit root_path
  end

  describe 'When I visit the welcome page' do
    it 'I see the title of the application' do
      expect(page).to have_content('Viewing Party')
    end

    it 'I see a button to create a new user' do
      click_button 'Create a New User'

      expect(current_path).to eq(register_path)
    end

    it 'I see a list of existing users which links to the users dashboard' do
      within "#existing-users" do
        expect(page).to have_content(user_1.email)
        expect(page).to have_content(user_2.email)
        expect(page).to have_content(user_3.email)

        click_link user_1.email
      end

      expect(current_path).to eq(user_path(user_1))
    end

    it 'I see a link to go back to the landing page' do
      click_link 'Home'

      expect(current_path).to eq(root_path)
    end
  end
end