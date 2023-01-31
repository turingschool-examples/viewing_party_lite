# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user new' do
  before :each do
    visit '/register'
  end

  describe 'happy path' do
    it 'displays user registration form' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_button('Submit')
    end

    it 'redirects visitor to user show page upon succesful registration' do
      fill_in 'Name', with: 'test user'
      fill_in 'Email', with: 'testuser@example.com'
      click_button('Submit')
      expect(current_path).to eq(user_path(User.last.id))
    end

    # An inconsequential feature I added for fun 
    it 'downcases user email upon succesful registration' do
      fill_in 'Name', with: 'TEST USER'
      fill_in 'Email', with: 'TESTUSER@example.com'
      click_button('Submit')

      expect(User.last.email).to eq('testuser@example.com')
    end
  end
end
