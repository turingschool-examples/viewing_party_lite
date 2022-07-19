# frozen_string_literal: true

require 'rails_helper'

describe 'user new/registration page' do
  before do
    visit '/register'
  end
  it 'has a form to create a new user, and once created it redirects to the new users show page' do
    expect(page).to have_content('Register a New User')

    fill_in 'user_name', with: 'Jane'
    fill_in 'user_email', with: 'eleven@upsidedown.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button('Create New User')

    user = User.find_by(email: "eleven@upsidedown.com")
    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq('password123')
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Jane's Dashboard")
  end

  it 'displays an error message if the email entered is not unique' do
    User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 
    'test123')

    fill_in 'user_name', with: 'Max'
    fill_in 'user_email', with: 'eleven@upsidedown.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button('Create New User')

    expect(current_path).to eq('/register')
    expect(page).to have_content('Email has already been taken')
  end

  it 'displays an error message if a name is not entered on the form' do
    fill_in 'user_name', with: ''
    fill_in 'user_email', with: 'eleven@upsidedown.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button('Create New User')

    expect(current_path).to eq('/register')
    expect(page).to have_content("Name can't be blank")
  end

  it 'displays an error message if a name is not entered on the form and the email is not unique' do
    User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 'test123')

    fill_in 'user_name', with: ''
    fill_in 'user_email', with: 'eleven@upsidedown.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button('Create New User')
    
    expect(current_path).to eq('/register')
    expect(page).to have_content('Email has already been taken')
    expect(page).to have_content("Name can't be blank")
  end

  it 'displays an error message if the confirmation does not match' do
    User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 'test123')

    fill_in 'user_name', with: 'Jane'
    fill_in 'user_email', with: 'hawkins@upsidedown.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: ''
    click_button('Create New User')
    
    expect(current_path).to eq('/register')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
  
  it 'displays an error message if a password is not given' do
    User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 'test123')
    fill_in 'user_name', with: 'Jane'
    fill_in 'user_email', with: 'hawkins@upsidedown.com'
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: ''
    click_button('Create New User')

    expect(current_path).to eq('/register')
    expect(page).to have_content("Password can't be blank")
  end
end
