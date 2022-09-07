# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Register' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g', password: 'test123')

    visit '/register'
  end

  it 'can register user' do
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'sm@g'
    fill_in :user_password, with: 'test456'
    fill_in :user_password_confirmation, with: 'test456'
    click_on 'Create User'
    
    expect(current_path).to eq("/users/#{@eli.id + 1}")
    expect(page).to have_content("Sunny's Dashboard")
    expect(page).to_not have_content("Eli's Dashboard")
  end

  it 'sad path testing 1' do # no name
    fill_in 'Email', with: 'sm@g'
    fill_in :user_password, with: 'test456'
    fill_in :user_password_confirmation, with: 'test456'
    click_on 'Create User'
    expect(current_path).to eq('/register')
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content("Name can't be blank")
  end

  it 'sad path testing 2' do # duplicate email
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'es@g'
    fill_in :user_password, with: 'test456'
    fill_in :user_password_confirmation, with: 'test456'
    click_on 'Create User'
    expect(current_path).to eq('/register')
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content("Email has already been taken")
  end
  
  it 'sad path testing 3' do # unmatched passwords
    fill_in 'Name', with: 'Sunny'
    fill_in 'Email', with: 'sm@g'
    fill_in :user_password, with: 'test456'
    fill_in :user_password_confirmation, with: 'test789'
    click_on 'Create User'
    expect(current_path).to eq('/register')
    expect(page).to_not have_content("Sunny's Dashboard")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'has link to landing page' do
    expect(page).to have_link('Home')
    click_on 'Home'
    expect(current_path).to eq('/')
  end
end
