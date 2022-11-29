require 'rails_helper'

RSpec.describe 'the Welcome Page', type: :feature do
  let!(:user_1) {User.create!(name: 'Naomi', email: 'nomi@yahoo.com')}
  let!(:user_2) {User.create!(name: 'Joe', email: 'joe@hotmail.com')}
  let!(:user_3) {User.create!(name: 'Zuko', email: 'zuko@gmail.com')}

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

    it 'I see a list of existing users which links to the users dashboard' do
      visit root_path
      
      within "#existing-users" do
        expect(page).to have_content(user_1.email)
        expect(page).to have_content(user_2.email)
        expect(page).to have_content(user_3.email)

        click_link user_1.email
      end

      expect(current_path).to eq(user_path(user_1))
    end

    it 'I see a link to go back to the landing page' do
      visit root_path

      click_link 'Home'

      expect(current_path).to eq(root_path)
    end
  end
end