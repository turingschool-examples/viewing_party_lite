require 'rails_helper'

RSpec.describe 'creating a new user' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }

  before :each do
    visit root_path
  end

  it 'links to a form to create a new user' do

    click_link('Create a New User')
    expect(current_path).to eq(register_path)

    within '#new-user' do
      fill_in 'Name', with: 'Jerry'
      fill_in 'Email', with: 'jerry@trashtv.com'
      fill_in :password, with: 'guiltypleasure99'
      fill_in :password_confirmation, with: 'guiltypleasure99'
      click_on 'Create New User'
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Jerry's Dashboard")
    expect(page).to_not have_content("#{user1.name}'s Dashboard")
    expect(page).to_not have_content("#{user2.name}'s Dashboard")

    visit root_path

    within "#user-#{user1.id}" do
      expect(page).to have_content("#{user1.name}: #{user1.email}")
    end

    within "#user-#{user2.id}" do
      expect(page).to have_content("#{user2.name}: #{user2.email}")
    end

    within "#user-#{user3.id}" do
      expect(page).to have_content("#{user3.name}: #{user3.email}")
    end

    expect(page).to have_link("jerry@trashtv.com's Dashboard")
  end

  it 'should check for uniqueness of email address and be case insensitive' do
    User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')

    click_link('Create a New User')
    expect(current_path).to eq(register_path)

    within '#new-user' do
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

    click_link('Create a New User')
    expect(current_path).to eq(register_path)

    within '#new-user' do
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

    click_link('Create a New User')
    expect(current_path).to eq(register_path)

    within '#new-user' do
      fill_in 'Email', with: 'jerry@trashtv.com'
      fill_in :password, with: 'guiltypleasure99'
      fill_in :password_confirmation, with: 'guiltypleasure99'
      click_on 'Create New User'
    end

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Name can't be blank")
  end
end
