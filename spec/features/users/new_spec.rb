require 'rails_helper'

RSpec.describe 'User Create Page' do
  it 'links to a form to create a new user' do
    user1 = User.create(name: 'jared', email: 'jared@gmail.com', password: "password", password_confirmation: "password")
    user2 = User.create(name: 'james', email: 'james@gmail.com', password: "password2", password_confirmation: "password2")
    user3 = User.create(name: 'frank', email: 'frank@gmail.com', password: "password3", password_confirmation: "password3")

    visit users_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'rick'
      fill_in 'Email', with: 'ricky@gmail.com'
      fill_in 'Password:', with: 'movieman2'
      fill_in 'Password Confirmation:', with: 'movieman2'
      click_on 'Create New User'
    end

    expect(current_path).to eq user_path(User.last)

    expect(page).to have_content("#{User.last.name} has been created!")

    visit users_path

    within "#user-#{user1.id}" do
      expect(page).to have_link("jared@gmail.com's Dashboard", href: user_path(user1))
    end

    within "#user-#{user2.id}" do
      expect(page).to have_link("james@gmail.com's Dashboard", href: user_path(user2))
    end

    within "#user-#{user3.id}" do
      expect(page).to have_link("frank@gmail.com's Dashboard", href: user_path(user3))
    end

    expect(page).to have_link("ricky@gmail.com's Dashboard")
  end

  it 'should check for uniqueness of email address and be case insensitive' do
    user1 = User.create(name: 'jared', email: 'jared@gmail.com', password: "password")

    visit users_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'Jared Hardinger'
      fill_in 'Email', with: 'jared@gmail.com'
      fill_in 'Password:', with: 'password'
      fill_in 'Password Confirmation:', with: 'password'
      click_on 'Create New User'
    end

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Error: That email is already associated with an account.")
  end

  it 'encrypts a user password when a new user is created' do
    visit users_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'Billy'
      fill_in 'Email', with: 'billy@gmail.com'
      fill_in 'Password:', with: 'testpassword'
      fill_in 'Password Confirmation:', with: 'testpassword'
      click_on 'Create New User'
    end

    expect(User.last.password_digest).to_not eq 'testpassword'
  end

  it 'requires the password and password confirmation to match to create a user' do
    visit users_path

    click_button('Create a New User')
    expect(current_path).to eq(register_path)

    within '#create-user' do
      fill_in 'Name', with: 'Billy'
      fill_in 'Email', with: 'billy@gmail.com'
      fill_in 'Password:', with: 'testpassword'
      fill_in 'Password Confirmation:', with: 'whack'
      click_on 'Create New User'
    end

    expect(current_path).to eq register_path
    expect(page).to have_content 'Error: Both passwords must match.'
  end
end