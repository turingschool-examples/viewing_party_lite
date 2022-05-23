# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User Page', type: :feature do
  describe 'happy path' do
    it 'filling in the form correctly redirects me to my new user dashboard/show page' do
      visit '/register'
      # save_and_open_page
      fill_in :name, with: 'skeeter'
      fill_in :email, with: 'skeeter@example.com'
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'password'
      click_on 'Create User'

      new_user = User.last
      expect(current_path).to eq("/users/#{new_user.id}")
    end
  end 

  describe 'sad path' do
    it 'bad passwords results in redirect back to /register w/ error message' do
      visit '/register'
     
      fill_in :name, with: 'skeeter'
      fill_in :email, with: 'skeeter@example.com'
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'not password'
      click_on 'Create User'
      save_and_open_page
      expect(current_path).to eq("/register")
      expect(page).to have_content("Passwords do not match")
    end

    it 'bad/non-unique email results in redirect back to /register w/ error message' do
      user1 = User.create!(name: 'bob', email: 'skeeter@example.com', password: 'password123', password_confirmation: 'password123')
      visit '/register'
     
      fill_in :name, with: 'skeeter'
      fill_in :email, with: 'skeeter@example.com'
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'not password'
      click_on 'Create User'
      # save_and_open_page
      expect(current_path).to eq("/register")
      expect(page).to have_content("Password must be unique")
    end



  end
end

# within '#new-user-form' do
#   fill_in :name,	with: 'Zel'
#   fill_in :email, with: 'lorem@ipsum.dorum'
#   click_on :submit
# end

# new_user = User.where(email: 'lorem@ipsum.dorum').first
# expect(current_path).to eq("/users/#{new_user.id}")