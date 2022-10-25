require 'rails_helper'

RSpec.describe 'creating a new user' do
  it 'links to a form to create a new user' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'Jerry'
      fill_in 'Email', with: 'jerry@trashtv.com'
      fill_in :password, with: 'guiltypleasure99'
      fill_in :password_confirmation, with: 'guiltypleasure99'
      click_on 'Create New User'
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Jerry's Dashboard")
    expect(page).to_not have_content("Maury's Dashboard")
    expect(page).to_not have_content("Jenny's Dashboard")

    visit root_path

    within "#user-#{user1.id}" do
      expect(page).to have_content('Geraldo: geraldo@trashtv.com')
      expect(page).to have_content("#{user1.name}: #{user1.email}")
    end

    within "#user-#{user2.id}" do
      expect(page).to have_content('Maury: maury@trashtv.com')
      expect(page).to have_content("#{user2.name}: #{user2.email}")
    end

    within "#user-#{user3.id}" do
      expect(page).to have_content('Jenny: jenny@trashtv.com')
      expect(page).to have_content("#{user3.name}: #{user3.email}")
    end

    expect(page).to have_link("jerry@trashtv.com's Dashboard")
  end

  it 'should check for uniqueness of email address and be case insensitive' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'Rivera Geraldo'
      # Test that capitalization will still result in account not being createable
      fill_in 'Email', with: 'Geraldo@trashtv.com'
      fill_in :password, with: 'password1234'
      fill_in :password_confirmation, with: 'password1234'
      click_on 'Create New User'
    end

    expect(current_path).to eq(register_path)
    expect(page).to have_content('Email has already been taken')
  end

  it 'should check that password and confirmation match' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'Jerry'
      fill_in 'Email', with: 'jerry@trashtv.com'
      fill_in :password, with: 'guiltypleasure99'
      fill_in :password_confirmation, with: 'guiltypleasure98'
      click_on 'Create New User'
    end

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'should not create user if name is not filled in' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')

    visit root_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Email', with: 'jerry@trashtv.com'
      fill_in :password, with: 'guiltypleasure99'
      fill_in :password_confirmation, with: 'guiltypleasure99'
      click_on 'Create New User'
    end

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Name can't be blank")
  end
end
