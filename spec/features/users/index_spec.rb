# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    @user1 = create(:user)
    @user2 = create(:user)
    visit '/'
  end

  describe 'as a user' do
    it 'I see the title of the application' do
      expect(page).to have_content('Viewing Party')
    end

    it 'I see a link to the landing page' do
      expect(page).to have_button('Landing Page')
      click_button('Landing Page')
      expect(current_path).to eq('/')
    end

    context 'when logged out' do 
      it 'I see a button to create a new user' do
        expect(page).to have_button('Create New User')
        click_button('Create New User')
        expect(current_path).to eq('/register')
      end

      it 'i see a button to the login page' do 
        expect(page).to have_button('Log In')
        click_button('Log In')
        expect(current_path).to eq('/login')
      end

      it 'i do not see a list of existing users emails' do 
        within('#users') do
          expect(page).to_not have_content(@user1.email)
          expect(page).to_not have_content(@user2.email)
        end
      end
    end

    context 'when logged in' do 
      before(:each) do 
        visit '/login'
        fill_in 'email', with: @user1.email
        fill_in 'password', with: @user1.password
        click_button 'Log In'
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit '/'
      end

      it 'does not have a login or create new user button' do 
        expect(page).to_not have_button('Log In')
        expect(page).to_not have_button('Create New User')
      end

      it 'has a button that logs the user out' do 
        within '#landing-page' do 
          expect(page).to have_button('Logout')

          click_button('Logout')
        end

        expect(current_path).to eq('/')
        expect(page).to have_button('Log In')
      end

      it 'I see a list of existing users emails, which are not linked' do
        within('#users') do
          expect(page).to have_content(@user1.email)
          expect(page).to have_content(@user2.email)

          expect(page).to_not have_link(@user1.email)
          expect(page).to_not have_link(@user2.email)
        end
      end
    end
  end
end
