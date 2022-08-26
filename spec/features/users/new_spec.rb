require 'rails_helper'

RSpec.describe 'creating a new user' do
  it 'links to a form to create a new user' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: "password")
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: "password")

    visit root_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'Jerry'
      fill_in 'Email', with: 'jerry@trashtv.com'
      fill_in 'Password', with: 'guiltypleasure99'
      click_on 'Create New User'
    end

    expect(current_path).to eq user_path(User.last)
    expect(page).to have_content("Jerry's Dashboard")
    expect(page).to_not have_content("Maury's Dashboard")
    expect(page).to_not have_content("Jenny's Dashboard")

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

    expect(page).to have_link("jerry@trashtv.com's Dashboard")
  end

  it 'should check for uniqueness of email address and be case insensitive' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")

    visit root_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'Rivera Geraldo'
      # Test that capitalization will still result in account not being createable
      fill_in 'Email', with: 'Geraldo@trashtv.com'
      fill_in 'Password', with: 'password1234'
      click_on 'Create New User'
    end

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Error: That email is already associated with an account.")
  end
end
