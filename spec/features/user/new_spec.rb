require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  describe 'create a new user' do
    it 'can fill out the form' do
      visit '/register'
      expect(current_path).to eq('/register')

      fill_in :name, with: 'Joker'
      fill_in :email, with: 'badman@takeover.edu'
      fill_in :password, with: 'gotham123'
      fill_in :password_confirmation, with: 'gotham123'

      click_button 'Create New User'
      expect(current_path).to eq(user_path(User.last))

      expect(page).to have_content('Joker')
    end
  end

  describe 'sad path' do 
    it 'denies registration due to mismatched passwords' do 
      visit register_path 

      expect(current_path).to eq('/register')

      fill_in :name, with: 'Joker'
      fill_in :email, with: 'badman@takeover.edu'
      fill_in :password, with: 'gotham123'
      fill_in :password_confirmation, with: 'gotham456'

      click_button 'Create New User'

      expect(current_path).to eq(register_path)
    end
  end
end
