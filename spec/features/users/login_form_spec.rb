require 'rails_helper'

RSpec.describe 'Login Form', type: :feature do
  let!(:user) { User.create(user_name: 'Blob', email: 'BlobJohnson@msn.com', password: 'bloop', password_confirmation: 'bloop') }
  describe 'happy path' do
    it 'has the correct fields' do
      visit '/login'

      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end
    it 'can log a user in' do
      visit '/login'
      fill_in :Email, with: 'BlobJohnson@msn.com'
      fill_in :Password, with: 'bloop'
      click_button 'Log In'
      expect(current_path).to eq("/users/#{user.id}")
    end
  end
  describe 'sad path' do
    it 'displays an error and routes back to the log in page with incorrect password' do
      visit '/login'
      fill_in :Email, with: 'BlobJohnson@msn.com'
      fill_in :Password, with: 'loop'
      click_button 'Log In'
      expect(current_path).to eq('/login')
      expect(page).to have_content('Invalid Credentials')
    end

    it 'displays an error and routes back to the log in page with incorrect email' do
      visit '/login'
      fill_in :Email, with: 'BloooobJohnson@msn.com'
      fill_in :Password, with: 'bloop'
      click_button 'Log In'
      expect(current_path).to eq('/login')
      expect(page).to have_content('Invalid Credentials')
    end
  end
end