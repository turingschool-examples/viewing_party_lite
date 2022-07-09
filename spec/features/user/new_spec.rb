require 'rails_helper'

RSpec.describe User: :New do
  it 'has a link form the landing page' do
    visit root_path

    click_on('Create an Account')

    expect(current_path).to eq('/register')
  end

  describe 'happy path' do
    it 'can fill out a form and create a new user' do
      visit register_path

      fill_in('Name', with: 'Ronald')
      fill_in('Email', with: 'thedon@gmail.com')

      click_on 'Submit'

      user = User.last

      expect(current_path).to eq("/users/#{user.id}/dashboard")
      expect(page).to have_content("Welcome #{user.name}")
    end
  end

  describe 'sad path' do
    it 'will not let you create an account if the email is not unique' do
      visit register_path

      fill_in('Name', with: 'Ronald')
      fill_in('Email', with: 'thedon@gmail.com')

      click_on 'Submit'

      user = User.first

      visit register_path

      fill_in('Name', with: 'Mcdonald')
      fill_in('Email', with: 'thedon@gmail.com')
      click_on 'Submit'

      expect(page).to have_content('Could not create user, email must be unique.')
    end
  end
end
