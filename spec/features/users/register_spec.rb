# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration page' do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
  end
  # When a user visits the '/register' path they should see a form to register.

  # The form should include:

  # Name
  # Email (must be unique)
  # Register Button
  # Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.

  describe 'User Registration Page #5' do
    it 'When a user visits the register path they should see a form to register.' do
      visit register_path

      fill_in 'name', with: 'James Dean'
      fill_in 'email', with: 'jimmydean1979@goodinternet.net'
      fill_in 'password', with: 'password123'
      fill_in 'password_confirmation', with: 'password123'

      click_on 'Save'

      user = User.last
      expect(current_path).to eq(user_path(user))
    end

    it 'has happy path' do
      visit register_path

      fill_in 'name', with: 'James Dean'
      fill_in 'email', with: 'jimmydean1979@goodinternet.net'
      fill_in 'password', with: 'password123'
      fill_in 'password_confirmation', with: 'password123'

      click_on 'Save'

      expect(page).to have_content('User Registered Successfully')
    end

    it 'has sad path' do
      visit register_path

      click_on 'Save'

      expect(page).to have_content("Name can't be blank, Email can't be blank")
    end

    it 'has sad path for password not being entered' do
      visit register_path

      fill_in 'name', with: 'James Dean'
      fill_in 'email', with: 'jimmydean1979@goodinternet.net'

      click_on 'Save'

      expect(page).to have_content("Password digest can't be blank, Password confirmation can't be blank, and Password can't be blank")
    end

    it 'has sad path for password confirmaiton not matching password' do
      visit register_path

      fill_in 'name', with: 'James Dean'
      fill_in 'email', with: 'jimmydean1979@goodinternet.net'
      fill_in 'password', with: "testing123"
      fill_in 'password_confirmation', with: "123testing"

      click_on 'Save'

      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it 'stores user password securely in password digest' do
      visit register_path

      fill_in 'name', with: 'James Dean'
      fill_in 'email', with: 'jimmydean1979@goodinternet.net'
      fill_in 'password', with: "testing123"
      fill_in 'password_confirmation', with: "testing123"

      click_on 'Save'
      expect(User.last).to have_attribute(:password_digest)
      expect(User.last).to_not have_attribute(:password)
      expect(User.last.password_digest).to_not eq('testing123')
    end
  end
end
