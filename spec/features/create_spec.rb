require 'rails_helper'
require 'faker'

RSpec.describe 'user creation' do
  describe 'the user registration' do
    it 'renders the new form' do
      visit "/register"

      expect(page).to have_content('Register a New User')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Email')
      expect(page).to have_button('Create New User')
    end

    it 'creates the user and redirects to the user show page' do
      user = User.create!(name: 'Zelda', email: 'imnotlink@damnyall.com', password: 'rupee1')

      visit "/register"

      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'password', with: 'rupee1'
      fill_in 'password_confirmation', with: 'rupee1'

      click_button 'Create New User'

      expect(page).to have_current_path("/users/#{user.id + 1}")
    end

    it 'gives warning for invalid data' do
      visit "/register"

      fill_in 'Name', with: ""
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'password', with: 'rupee1'
      fill_in 'password_confirmation', with: 'rupee1'

      click_button 'Create New User'

      expect(page).to have_current_path("/register")
      expect(page).to have_content("Error: Name can't be blank")

      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: ""
      fill_in 'password', with: 'rupee1'
      fill_in 'password_confirmation', with: 'rupee1'

      click_button 'Create New User'

      expect(page).to have_current_path("/register")
      expect(page).to have_content("Error: Email can't be blank")

      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: "abc@yahoo.com"
      fill_in 'password', with: 'rupee1'
      fill_in 'password_confirmation', with: 'rupee1'

      click_button 'Create New User'

      visit "/register"

      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: "abc@yahoo.com"
      fill_in 'password', with: 'rupee1'
      fill_in 'password_confirmation', with: 'rupee1'

      click_button 'Create New User'

      expect(page).to have_content("Error: Email has already been taken")
    end
  end
end
