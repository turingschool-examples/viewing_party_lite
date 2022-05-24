require 'rails_helper'

RSpec.describe "Home page", type: :feature do
  it 'has a title of the application' do
    visit "/"

    expect(page).to have_content("Viewing Party!")
  end

  it 'has a button to create a new user' do
    visit "/"

    click_button("Create New User")
    expect(current_path).to eq("/users/register")
  end

  it 'lists all existing users' do
    user1 = User.create!(name: "Susan", email: "susan@mail.com", password: "password", password_confirmation: "password")
    user2 = User.create!(name: "Tyler", email: "tyler@mail.com", password: "password", password_confirmation: "password")
    user3 = User.create!(name: "Sherman", email: "sherman@mail.com", password: "password", password_confirmation: "password")

    User.all.each do |user|
      visit "/"
      expect(page).to have_content(user.name)
      click_link("#{user.name}")
      expect(current_path).to eq("/users/#{user.id}")
    end
  end

  it 'has a link to return to home page' do
    visit "/"

    click_on("Home")
    expect(current_path).to eq("/")
  end

  it 'has a button to log in' do
    visit "/"

    click_on("Login")
    expect(current_path).to eq("/login")
  end

  it 'takes a user to their dashboard if password is right' do
    user = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")

    visit("/login")

    fill_in(:email, with: "joe@mail.com")
    fill_in(:password, with: "secret")
    click_on("Login")
    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'does not allow a sign in with the wrong password' do
    user = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")

    visit("/login")

    fill_in(:email, with: "joe@mail.com")
    fill_in(:password, with: "secretss")
    click_on("Login")

    expect(current_path).to eq("/login")
    expect(page).to have_content("Email or password are incorrect")
  end

  it 'needs a valid email to login' do
    user = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")

    visit("/login")

    fill_in(:email, with: "joey@mail.com")
    fill_in(:password, with: "secrets")
    click_on("Login")

    expect(current_path).to eq("/login")
    expect(page).to have_content("Email or password are incorrect")
  end
end
