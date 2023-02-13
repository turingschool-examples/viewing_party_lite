require 'rails_helper'

RSpec.describe 'login page', type: :feature do
  let!(:user1) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }

  describe 'login form' do
    it 'has email and pass fields' do
      visit login_path

      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
    end

    it 'can create a new user' do
      visit login_path

      fill_in(:email, with: 'anth@test.com')
      fill_in(:password, with: 'password123')

      click_button 'Login'

      expect(page).to have_content("Anth's Dashboard")
    end

    describe 'sad path form testing' do
      it 'declines if left blank' do
        visit login_path

        click_button 'Login'

        expect(page).to have_content('Invalid email or password')
      end
    end
  end
end
