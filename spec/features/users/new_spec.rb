# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User' do
  before :each do
    User.create!(name: 'Watson', email: 'watson@sleuth.com')
    visit '/register'
  end
  describe 'as a user' do
    it "I see a form to register a new user. Once the user registers they
    should be taken to a dashboard page '/users/:id', where :id is the id
    for the user that was just created." do
      fill_in 'name', with: 'Sherlock'
      fill_in 'email', with: 'sherlockh@sleuth.com'
      click_button 'Register User'

      user = User.last
      expect(current_path).to eq("/users/#{user.id}")
    end

    it 'if an email has already been registered the user is redirected to
    the form to register a new user where they see an error indicating
    the email already exists.' do
      fill_in 'name', with: 'Watson'
      fill_in 'email', with: 'watson@sleuth.com'
      click_button 'Register User'

      expect(current_path).to eq('/register')
      expect(page).to have_content('This email has already been registered')
    end
  end
end
