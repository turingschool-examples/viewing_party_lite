# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  context 'no current session/no user logged in' do
    before do
      visit '/'
    end
    it 'displays the title of the application, a button to register and a button to login' do
      expect(page).to have_content('Viewing Party Light')
      expect(page).to_not have_button('Logout')

      click_link('Homepage')
      expect(current_path).to eq('/')

      click_button('Register')
      expect(current_path).to eq('/register')

      visit '/'
      click_button('Login')
      expect(current_path).to eq('/login')
    end

    it "does not allow the visitor to access a dashboard without being logged in" do

      click_button ('Dashboard')
      expect(current_path).to eq('/')
      expect(page).to have_content('Please log in to access your dashboard!')
    end
    
  end

  context 'current session/user logged in' do
    before do
      user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com', password: 'test123')
      visit '/login'

      fill_in :email, with: 'jpowell38@gmail.com'
      fill_in :password, with: 'test123'

      click_button 'Log In'

      user2 = User.create!(name: 'Ann Miller', email: 'amiller@gmail.com', password: 'test123')
      visit '/'
    end

    it 'displays the title of the application, a button to create new users, and existing users' do
      expect(page).to have_content('Viewing Party Light')
      expect(page).to_not have_button('Register')
      expect(page).to_not have_button('Login')

      click_link('Homepage')
      expect(current_path).to eq('/')

      expect(page).to have_content('Existing Users:')

      within '#user-0' do
        expect(page).to have_content('jpowell38@gmail.com')
        expect(page).to_not have_content('amiller@gmail.com')
        visit '/'
      end
      within '#user-1' do
        expect(page).to_not have_content('jpowell38@gmail.com')
        expect(page).to have_content('amiller@gmail.com')
      end

      click_button('Logout')
      expect(current_path).to eq('/')
    end

    it "allows a user to access their dashboard" do
      click_button ('Dashboard')
      
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Jane Powell's Dashboard")
    end
  end
end
