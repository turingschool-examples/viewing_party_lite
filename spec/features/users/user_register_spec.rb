# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user registration page' do
  it 'has a form to register' do
    visit '/register'

    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_button('Register')
  end

  it 'should take the user to their dashboard page after they register' do
    visit '/register'

    fill_in :name, with: 'Katy Perry'
    fill_in :email, with: 'katyperry@email.com'
    click_on 'Register'

    test = User.first

    expect(current_path).to eq("/users/#{test.id}")
    expect(test.email).to eq('katyperry@email.com')
  end

  it 'should not register the user if the email address is already in use' do
    visit '/register'

    new_user = User.create(name: 'Michael Jackson', email: 'michaeljackson@email.com')
    fill_in :name, with: 'micheal impersonator'
    fill_in :email, with: 'michaeljackson@email.com'
    click_on 'Register'
    expect(current_path).to eq('/register')

    expect(page).to have_content('Error: Email has already been taken')
  end

  it 'notifies invalid data' do
    visit '/register'

    fill_in :name, with: ' '
    fill_in :email, with: 'michaeljackson@email.com'

    click_button 'Register'

    expect(page).to have_current_path('/register')
    expect(page).to have_content('Error: Email has already been taken')
  end
end
