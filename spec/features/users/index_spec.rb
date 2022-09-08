require 'rails_helper'

RSpec.describe 'the landing page' do
  it 'can only use link to dashboard if logged in and user' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    within "#user-#{user1.id}" do
      expect(page).to have_link("geraldo@trashtv.com's Dashboard", href: user_path(user1))
    end

    within "#user-#{user2.id}" do
      expect(page).to have_link("maury@trashtv.com's Dashboard", href: user_path(user2))
    end

    within "#user-#{user3.id}" do
      expect(page).to have_link("jenny@trashtv.com's Dashboard", href: user_path(user3))
    end

    click_link("geraldo@trashtv.com's Dashboard")
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You must be logged in')

    fill_in :email, with: 'geraldo@trashtv.com'
    fill_in :password, with: 'password'
    click_on 'Log In'
    click_link 'Home'

    expect(current_path).to eq(root_path)

    click_link("geraldo@trashtv.com's Dashboard")
    expect(current_path).to eq user_path(user1)
  end

  it 'has a button to create a new user that directs to the register page' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    expect(page).to have_button('Create a New User')

    click_button('Create a New User')

    expect(current_path).to eq register_path
    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_confirmation)
    expect(page).to have_button('Create New User')
  end

  it 'has a button to login' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button('Log In')
  end
end
