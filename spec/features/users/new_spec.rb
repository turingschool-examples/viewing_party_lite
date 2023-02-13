require 'rails_helper'

RSpec.describe 'new page', type: :feature do
  let!(:user1) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }

  describe 'new user form' do
    it 'has a name and email' do
      visit register_path

      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_field(:password_confirmation)
    end

    it 'can create a new user' do
      visit register_path

      fill_in(:name, with: 'Tony Pepperoni')
      fill_in(:email, with: 'thebigpepperoni@gmail.com')
      fill_in(:password, with: 'password123')
      fill_in(:password_confirmation, with: 'password123')

      click_button 'Register'

      expect(page).to have_content("Tony Pepperoni's Dashboard")
      expect(page).to_not have_content(user1.name)
    end

    describe 'sad path form testing' do
      it 'will not allow any field to be blank' do
        visit register_path

        click_button 'Register'

        expect(page).to have_content("Name can't be blank, Email can't be blank")
      end

      it 'will only allow unique email addresses (no copies) to sign up' do
        visit register_path

        fill_in(:name, with: 'Tony')
        fill_in(:email, with: 'anth@test.com')
        fill_in(:password, with: 'password123')
        fill_in(:password_confirmation, with: 'password123')

        click_button 'Register'

        expect(page).to have_content('Email has already been taken')
      end

      it 'will not allow registration with unmatching passwords' do
        visit register_path

        fill_in(:name, with: 'Tony')
        fill_in(:email, with: 'anth@test.com')
        fill_in(:password, with: 'passwot rd123')
        fill_in(:password_confirmation, with: 'passwo')

        click_button 'Register'

        expect(page).to have_content("Password confirmation doesn't match Password")
      end
    end
  end
end
