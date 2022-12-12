# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The Register Page', type: :feature do
  before do
    visit register_path
  end

  describe 'When I visit the register path' do
    it 'includes a form with name, email, password, and password confirmation and register button, once user registers they are directed to their dashboard page' do
      expect(page).to have_content('Register a New User')

      within '#register-form' do
        fill_in :name, with: 'Bob'
        fill_in :email, with: 'bob@gmail.com'
        fill_in :password, with: 'test123'
        fill_in :password_confirmation, with: 'test123'

        click_button 'Create New User'
      end

      new_user = User.last
      expect(page).to have_current_path(user_path(new_user), ignore_query: true)
    end

    it 'returns an error message if field is blank' do
      within '#register-form' do
        fill_in :name, with: ''
        fill_in :email, with: 'bob@gmail.com'
        fill_in :password, with: 'test123'
        fill_in :password_confirmation, with: 'test123'

        click_button 'Create New User'
      end

      expect(page).to have_current_path(register_path, ignore_query: true)
      expect(page).to have_content("Name can't be blank")
    end

    it 'returns an error message if email already exists' do
      existing_bob = User.create(name: 'Bob', email: 'bob@gmail.com', password: 'test123', password_confirmation: 'test123')

      within '#register-form' do
        fill_in :name, with: 'Bob'
        fill_in :email, with: 'bob@gmail.com'
        fill_in :password, with: 'test123'
        fill_in :password_confirmation, with: 'test123'

        click_button 'Create New User'
      end

      expect(page).to have_current_path(register_path, ignore_query: true)
      expect(page).to have_content('Email has already been taken')
    end
  end
end
