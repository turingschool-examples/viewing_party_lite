require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  # let!(:user_1) { User.create!(name: 'Alfred', email: 'alfred@butler.net', status: 0) }
  # let!(:user_2) { User.create!(name: 'Bruce', email: 'bruced@boss.net', status: 0) }
  # let!(:user_3) { User.create!(name: 'Oswald', email: 'oswald@cobblepot.gotham', status: 0) }

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
end
