
require 'rails_helper'

RSpec.describe 'Creating a new user' do
  describe 'As a visitor' do
    it 'When I visit the register path I see a form to register' do
      visit '/register'

      expect(current_path).to eq('/register')
    end

    it 'I fill in the form with data and am redirected to users show page' do
      visit '/register'

      fill_in('Name', with: 'Yuji')
      fill_in('Email', with: 'yuji@yuji.com')
      fill_in('Password', with: 'test12')
      fill_in('Password confirmation', with: 'test12')

      click_button('Create New User')
      new_user = User.last

      expect(page).to have_content("Welcome, Yuji!")
      expect(current_path).to eq("/users/#{new_user.id}")
    end

    it 'I fill in the form with data sad path' do
      visit '/register'

      fill_in('Name', with: '')
      fill_in('Email', with: 'yuji@yuji.com')
      fill_in('Password', with: 'test')
      fill_in('Password confirmation', with: 'test12')

      click_button('Create New User')
      new_user = User.last
      expect(page).to have_content("Name can't be blank")
      expect(current_path).to eq("/register")
    end

    it 'returns an error message if email is already taken' do
      @yuji = User.create!(name: 'Yuji', email: 'yuji@yuji.com', password_digest: "123", password_confirmation: '123')
      visit '/register'

      fill_in('Name', with: 'aaa')
      fill_in('Email', with: 'yuji@yuji.com')
      fill_in('Password', with: 'yuji')
      fill_in('Password confirmation', with: 'yuji')

      click_button('Create New User')

      expect(page).to have_content("Email has already been taken")
    end
  end
end
