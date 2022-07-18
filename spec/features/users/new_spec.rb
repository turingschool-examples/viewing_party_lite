require 'rails_helper'

RSpec.describe 'New page', type: :feature do
  it 'has a form' do
    visit '/register'
    expect(page).to have_field('User Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_field('Password Confirmation')
    expect(page).to have_button('Create User')
  end

  it 'can fill out and submit the form' do
    visit '/register'
    fill_in :User, with: 'SWilks'    
    fill_in :Email, with: 'stephenwilkens@gmail.com'    
    fill_in :Password, with: 'test123'    
    fill_in :user_password_confirmation, with: 'test123'    
    click_button 'Create User'
    new_user = User.last
    expect(current_path).to eq("/users/#{new_user.id}")
  end

  it 'can only use unique emails' do
    visit '/register'
    fill_in :User, with: 'SWilks'    
    fill_in :Email, with: 'stephenwilkens@gmail.com'
    fill_in :Password, with: 'test123'
    fill_in :user_password_confirmation, with: 'test123'
    click_button 'Create User'
    new_user = User.last
    expect(current_path).to eq("/users/#{new_user.id}")

    visit '/register'
    fill_in :User, with: 'Bob'    
    fill_in :Email, with: 'stephenwilkens@gmail.com'    
    click_button 'Create User'
    expect(page).to have_content('Email has already been taken')
    expect(current_path).to eq(register_path)
  end

  it 'user_name must be filled in' do
    visit '/register'
    fill_in :Email, with: 'stephenwilkens@gmail.com'
    fill_in :Password, with: 'test123'
    fill_in :user_password_confirmation, with: 'test123'
    click_button 'Create User'
    expect(page).to have_content("User name can't be blank")
    expect(current_path).to eq(register_path)
  end

  it 'user_name must be filled in' do
    visit '/register'
    fill_in :User, with: 'SWilks'    
    fill_in :Email, with: 'stephenwilkens@gmail.com'
    fill_in :Password, with: 'test123'
    fill_in :user_password_confirmation, with: 'test'
    click_button 'Create User'
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(current_path).to eq(register_path)
  end
end