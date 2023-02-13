require 'rails_helper'

RSpec.describe 'Register page' do
  describe 'Registration with authentication happy path' do
    it 'can successfully register a user' do
      user = create(:user)
      visit register_path

      fill_in('Name', with: 'Corey')
      fill_in('Email', with: 'Corey@gmail.com')
      fill_in('Password', with: 'password567')
      fill_in('Password confirmation', with: 'password567')
      click_on "Register new user"
      new_user = User.last.id

      expect(current_path).to eq(user_path(new_user))
    end
  end
  
  describe 'Registration with authentication sad path' do
    it 'will not register a user if passwords do not match' do

    end
  end
end