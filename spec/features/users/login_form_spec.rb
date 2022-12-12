require 'rails_helper'

RSpec.describe 'the Login Page', type: :feature do
  let!(:user) { create(:user, email: 'user@test.com', password: 'test123', password_confirmation: 'test123') }
  before :each do
    visit login_path
  end

  describe 'When I visit the login page' do
    it 'I can input email and password' do
      within '#login' do
        fill_in :email, with: user.email
        fill_in :password, with: user.password

        click_button 'Log In'
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{user.name}!")
    end

    it 'cannot log in with bad credentials' do
      within '#login' do
        fill_in :email, with: user.email
        fill_in :password, with: 'password'

        click_button 'Log In'
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Sorry, your credentials do not match.')
    end
  end
end
