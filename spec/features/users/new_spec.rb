# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user registration page' do
  describe 'as a user' do
    describe 'when a user visits the /register path' do
      it 'should should see a form to fill out a new user' do
        visit '/register'
        expect(page).to have_content('Name')
        expect(page).to have_field(:user_name)
        expect(page).to have_content('Email')
        expect(page).to have_field(:user_email)
        expect(page).to have_content('Password:')
        expect(page).to have_field(:user_password)
        expect(page).to have_content('Password Confirmation:')
        expect(page).to have_field(:user_password_confirmation)
        expect(page).to have_button('Create New User')
        expect(page).to have_link('Home')
        expect(page).to have_content('Viewing Party Lite')
      end
    end

    describe 'when i fill in form with a valid name and email and click create new user' do
      it 'I am redirected to the user show page' do
        visit '/register'

        fill_in :user_name, with: 'kristen'
        fill_in :user_email, with: 'kn@gmail.com'
        fill_in :user_password, with: '123gbfd123'
        fill_in :user_password_confirmation, with: '123gbfd123'

        click_on 'Create New User'
        # save_and_open_page
        expect(current_path).to eq("/dashboard")
      end
    end

    describe 'sad path testing' do
      describe 'when I fill in invalid name' do
        it 'I am redirected to the registration page and see error message' do
          visit '/register'

          fill_in :user_name, with: ''
          fill_in :user_email, with: 'kn@gmail.com'
          fill_in :user_password, with: '123gbfd123'
          fill_in :user_password_confirmation, with: '123gbfd123'

          click_on 'Create New User'

          expect(page).to have_content('ERROR: Please enter a valid name')
          expect(current_path).to eq('/register')
        end
      end

      describe 'when I fill in invalid email' do
        it 'I am redirected to the registration page and see error message' do
          visit '/register'

          fill_in :user_name, with: 'Kristen'
          fill_in :user_email, with: ''
          fill_in :user_password, with: '123gbfd123'
          fill_in :user_password_confirmation, with: '123gbfd123'

          click_on 'Create New User'

          expect(page).to have_content('ERROR: Please enter a valid email')
          expect(current_path).to eq('/register')
        end
      end

      describe 'when I fill in invalid name and email' do
        it 'I am redirected to the registration page and see error message' do
          visit '/register'

          fill_in :user_name, with: ''
          fill_in :user_email, with: ''
          fill_in :user_password, with: '123gbfd123'
          fill_in :user_password_confirmation, with: '123gbfd123'

          click_on 'Create New User'
          expect(page).to have_content('ERROR: Please enter a valid name and email')
          expect(current_path).to eq('/register')
        end
      end

      describe 'when I fill in a non-unique email' do
        it 'I am redirected to the registration page and see error message' do
          user = User.create!(name: 'Eli', email: 'eli@gmail.com', password: '157wut138')
          visit '/register'

          fill_in :user_name, with: 'Eli F'
          fill_in :user_email, with: 'eli@gmail.com'
          fill_in :user_password, with: '123gbfd123'
          fill_in :user_password_confirmation, with: '123gbfd123'

          click_on 'Create New User'

          expect(page).to have_content('ERROR: Email already in use. Please enter a different email')
          expect(current_path).to eq('/register')
        end
      end

      describe 'when my password and password confirmation do not match' do
        it "I'm taken back to the `/register` page and a flash message pops up, telling me what went wrong" do
          visit '/register'

          fill_in :user_name, with: 'kristen'
          fill_in :user_email, with: 'kn@gmail.com'
          fill_in :user_password, with: '123gbfd123'
          fill_in :user_password_confirmation, with: '123gbfd12'

          click_on 'Create New User'
          expect(current_path).to eq('/register')
          expect(page).to have_content('ERROR: Password Confirmation does not match Password')
        end
      end
    end
  end
end
