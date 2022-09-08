# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Register' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g', password: 'test', password_confirmation: 'test')

    visit register_path
  end

  it 'can register user' do
    fill_in :user_name, with: 'Sunny'
    fill_in :user_email, with: 'sm@g'
    fill_in :user_password, with: 'test2'
    fill_in :user_password_confirmation, with: 'test2'
    click_on 'Create User'
    expect(current_path).to eq("/users/#{@eli.id + 1}")
    expect(page).to have_content('Welcome, Sunny!')
    expect(page).to have_content("Sunny's Dashboard")
    expect(page).to_not have_content("Eli's Dashboard")
    expect(User.last.name).to eq('Sunny')
    expect(User.last).to_not have_attribute(:password)
    expect(User.last.password_digest).to_not eq('test2')
  end

  it 'sad path testing with error messages 1' do # no name
    fill_in 'Email', with: 'sm@g'
    fill_in :user_password, with: 'test'
    fill_in :user_password_confirmation, with: 'test'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content("Name can't be blank")
  end

  it 'sad path testing with error messages 2' do # no email
    fill_in 'Name', with: 'Sunny'
    fill_in :user_password, with: 'test'
    fill_in :user_password_confirmation, with: 'test'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content("Email can't be blank")
  end

  it 'sad path testing with error messages 3' do # duplicate email
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'es@g'
    fill_in :user_password, with: 'test'
    fill_in :user_password_confirmation, with: 'test'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content('Email has already been taken')
  end

  it 'sad path testing with error messages 4' do # no password
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'es@g'
    fill_in :user_password_confirmation, with: 'test'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content("Password can't be blank")
  end

  it 'sad path testing with error messages 5' do # no confirmation
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'es@g'
    fill_in :user_password, with: 'test'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content("Password confirmation can't be blank")
  end

  it 'sad path testing with error messages 6' do # different password/confirmation
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'es@g'
    fill_in :user_password, with: 'test1'
    fill_in :user_password_confirmation, with: 'test2'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'has link to landing page' do
    expect(page).to have_link('Home')
    click_on 'Home'
    expect(current_path).to eq('/')
  end
end
