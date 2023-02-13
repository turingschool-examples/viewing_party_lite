# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user registration page' do
  before :each do
    visit register_path
  end

  describe 'initial tests' do
    it 'has a form to create a new user' do
      ViewingPartyUser.delete_all
      ViewingParty.delete_all
      User.delete_all

      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_button('Register new user')
    end

    it 'can be filled in and submitted' do
      fill_in('Name', with: 'Jeff Goldblum')
      fill_in('Email', with: 'JurassicSnark@gmail.com')
      fill_in('Password', with: 'password123')
      fill_in('Password confirmation', with: 'password123')
    
      click_on 'Register new user'

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content('Jeff Goldblum')
      expect(page).to have_content('User has been created!')
    end

    it 'returns an error if the email has an existing user' do
      fill_in('Name', with: 'Jeff Goldblum')
      fill_in('Email', with: 'JurassicSnark@gmail.com')
      fill_in('Password', with: 'password567')
      fill_in('Password confirmation', with: 'password567')
      click_on 'Register new user'
      visit register_path

      fill_in('Name', with: 'John Doe')
      fill_in('Email', with: 'JurassicSnark@gmail.com')
      fill_in('Password', with: 'password567')
      fill_in('Password confirmation', with: 'password567')
      click_on 'Register new user'

      expect(current_path).to eq(register_path)
      save_and_open_page

      expect(page).to have_content("Email has already been taken")
    end
  end
end
