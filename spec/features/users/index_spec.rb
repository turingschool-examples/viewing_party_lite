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

    it 'I see a button to create a new user' do
      expect(page).to have_button('Create New User')
      click_button('Create New User')
      expect(current_path).to eq('/register')
    end

    it 'I see a list of existing users' do
      within('#users') do
        expect(page).to have_content(@user1.name)
        expect(page).to have_content(@user2.name)
      end
    end

    it 'I see a link to the landing page' do
      expect(page).to have_link('Landing Page')
      click_link('Landing Page')
      expect(current_path).to eq('/')
    end

    it 'i see a button to the login page' do 
      expect(page).to have_button('Log In')
      click_button('Log In')
      expect(current_path).to eq('/login')
    end
  end
end
