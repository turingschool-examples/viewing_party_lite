# frozen_string_literal: true

require 'rails_helper'

describe 'user new/registration page' do
  before do
    visit '/register'
  end
  it 'has a form to create a new user, and once created it redirects to the new users show page' do
    expect(page).to have_content('Register a New User')

    fill_in 'user[name]', with: 'Jane'
    fill_in 'user[email]', with: 'eleven@upsidedown.com'
    click_button('Create New User')

    user = User.last
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("#{user.name}'s Dashboard")
  end

  it 'displays an error message if the email entered is not unique' do
    User.create!(name: 'Jane', email: 'eleven@upsidedown.com')

    fill_in 'user[name]', with: 'Max'
    fill_in 'user[email]', with: 'eleven@upsidedown.com'
    click_button('Create New User')
    expect(current_path).to eq('/register')
    expect(page).to have_content('Oops, that email is already in use! Please try again with a unique email.')
  end

  it 'displays an error message if a name is not entered on the form' do
    fill_in 'user[name]', with: ''
    fill_in 'user[email]', with: 'eleven@upsidedown.com'
    click_button('Create New User')

    expect(current_path).to eq('/register')
    expect(page).to have_content('Please enter a valid name.')
  end

  it 'displays an error message if a name is not entered on the form and the email is not unique' do
    
    User.create!(name: 'Jane', email: 'eleven@upsidedown.com')

    fill_in 'user[name]', with: ''
    fill_in 'user[email]', with: 'eleven@upsidedown.com'
    click_button('Create New User')
    expect(current_path).to eq('/register')
    expect(page).to have_content('Please enter a valid name and unique e-mail address.')
  end
end
