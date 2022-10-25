require 'rails_helper'

RSpec.describe 'User login' do
  describe 'when I visit the login page' do
    let!(:users) { create_list(:user, 10) }
    let!(:user_1) { users.first }
    let!(:user_2) { users.last }
    let!(:random_user) { users.sample }

    it 'the landing page has a button to log in' do
      visit '/'

      expect(page).to have_button('Log In')

      click_button 'Log In'

      expect(current_path).to eq(login_path)

      fill_in 'Email', with: "#{user_1.email}"
      fill_in 'Password', with: "#{user_1.password}"

      click_button 'Log In'

      expect(current_path).to eq(user_path(user_1))
    end

    it 'will redirect to the login form if email is not registered' do
      visit login_path

      fill_in 'Email', with: "s#{user_1.email}"
      fill_in 'Password', with: "#{user_1.password}"

      click_button 'Log In'
      
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Error: Invalid email address")
    end

    it 'will redirect to the login form if password is incorrect' do
      visit login_path

      fill_in 'Email', with: "#{user_1.email}"
      fill_in 'Password', with: "s#{user_1.password}"

      click_button 'Log In'
      
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Error: Invalid password")
    end
  end
end