# frozen_string_literal: true

require 'rails_helper'

describe 'login page' do
  context 'default user login' do
    before do
      visit '/login'
    end
    it 'has a form to login and once authenticated with a successful login it redirects to the new users show page' do
      User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 'test123')

      fill_in 'email', with: 'eleven@upsidedown.com'
      fill_in 'password', with: 'test123'
      click_button('Log In')
      # user = User.find_by(email: 'eleven@upsidedown.com')

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Jane's Dashboard")
    end

    it 'has a form to login and provides an error message if the password/credentials are not correct.' do
      User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password:
          'test123')

      fill_in 'email', with: 'eleven@upsidedown.com'
      fill_in 'password', with: 'testing123'
      click_button('Log In')
      # user = User.find_by(email: 'eleven@upsidedown.com')

      expect(current_path).to eq('/login')
      expect(page).to have_content('Invalid Credentials')
    end
  end

  context 'admin user login' do
    before do
      visit '/login'
    end
    it 'redirects admin to the admin dashboard after logging in' do
      User.create(name: 'Jenn', email: 'halloran@udel.edu', password: 'supersecret', role: 1)
      User.create(name: 'Thomas', email: 'thomas@gmail.com', password: 'supersecret', role: 1)
      user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 'test123')
      user2 = User.create!(name: 'Hopper', email: 'hopper@upsidedown.com', password: 'test123')

      fill_in 'email', with: 'halloran@udel.edu'
      fill_in 'password', with: 'supersecret'

      click_button('Log In')
      expect(current_path).to eq('/admin/dashboard')

      expect(page).to have_content('hopper@upsidedown.com')
      expect(page).to have_content('eleven@upsidedown.com')
      expect(page).to_not have_content('halloran@udel.edu')
      expect(page).to_not have_content('thomas@gmail.com')
      click_link('eleven@upsidedown.com')
      expect(current_path).to eq(admin_user_path(user1))
    end
  end
end
