# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User Page', type: :feature do
  describe 'happy path' do
    it 'filling in the form correctly redirects me to my new user dashboard/show page', :vcr do
      visit '/register'
      # save_and_open_page
      fill_in :user_name, with: 'skeeter'
      fill_in :user_email, with: 'skeeter@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Create User'

      new_user = User.last
      # binding.pry
      expect(current_path).to eq("/dashboard")
    end
  end 

  describe 'sad path' do
    it 'bad passwords results in redirect back to /register w/ error message', :vcr do
      visit '/register'
     
      fill_in :user_name, with: 'skeeter'
      fill_in :user_email, with: 'skeeter@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'not password'
      click_on 'Create User'
      # save_and_open_page
      expect(current_path).to eq("/register")
      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it 'bad/non-unique email results in redirect back to /register w/ error message', :vcr do
      user1 = User.create!(name: 'bob', email: 'skeeter@example.com', password: 'password123', password_confirmation: 'password123')
      visit '/register'
     
      fill_in :user_name, with: 'skeeter'
      fill_in :user_email, with: 'skeeter@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Create User'
      # save_and_open_page
      expect(current_path).to eq("/register")
      expect(page).to have_content("Email has already been taken")
    end

    it 'blank name results in redirect back to /register w/ error message', :vcr do
      visit '/register'
     
      fill_in :user_email, with: 'skeeter@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Create User'
      expect(current_path).to eq("/register")
      expect(page).to have_content("Name can't be blank")
    end
  end

end

