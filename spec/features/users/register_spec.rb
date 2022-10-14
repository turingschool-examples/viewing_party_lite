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

      click_on 'Save'

      user = User.last
      expect(current_path).to eq(user_path(user))
    end

    it 'has happy path' do
      visit register_path

      fill_in 'name', with: 'James Dean'
      fill_in 'email', with: 'jimmydean1979@goodinternet.net'

      click_on 'Save'

      expect(page).to have_content('User Registered Successfully')
    end

    it 'has sad path' do
      visit register_path

      click_on 'Save'

      expect(page).to have_content("Name can't be blank and Email can't be blank")
    end
  end
end
