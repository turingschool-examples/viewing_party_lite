# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User | Register/New' do
  describe 'When I visit /register;'
  it 'I see a form to register' do
    visit register_path

    expect(page).to have_field(:user_name)
    expect(page).to have_field(:user_email)
    expect(page).to have_button('Register')
  end
  context 'Happy Path' do
    it 'should take the user to their dashboard page after they register' do
      visit register_path

      fill_in :user_name, with: 'Katy Perry'
      fill_in :user_email, with: 'katyperry@email.com'
      click_on 'Register'

      test = User.last

      expect(current_path).to eq("/users/#{test.id}")
      expect(test.email).to eq('katyperry@email.com')
    end
  end
  context 'Sad Path' do
    it 'should not register the user if the email address is already in use' do
      visit register_path

      User.create(name: 'Michael Jackson', email: 'michaeljackson@email.com')
      fill_in :user_name, with: 'micheal impersonator'
      fill_in :user_email, with: 'michaeljackson@email.com'
      click_on 'Register'

      expect(current_path).to eq('/register')
      expect(page).to have_content('Error: Email has already been taken')
    end

    it 'give alert for invalid data' do
      visit register_path

      fill_in :user_name, with: ' '
      fill_in :user_email, with: 'michaeljackson@email.com'

      click_button 'Register'

      expect(page).to have_current_path('/register')
      expect(page).to have_content("Error: Name can't be blank")
    end
  end
end
