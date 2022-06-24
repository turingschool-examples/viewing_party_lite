require 'rails_helper'

RSpec.describe "Home page", type: :feature do
  it 'has a title of the application' do
    visit "/"

    expect(page).to have_content("Viewing Party!")
  end

  it 'has a button to create a new user' do
    visit "/"

    click_on("Register")
    expect(current_path).to eq("/register")
  end

  it 'lists all existing users' do
    user1 = User.create!(name: "Susan", email: "susan@mail.com", password: "password", password_confirmation: "password")
    user2 = User.create!(name: "Tyler", email: "tyler@mail.com", password: "password", password_confirmation: "password")
    user3 = User.create!(name: "Sherman", email: "sherman@mail.com", password: "password", password_confirmation: "password")

    visit "/login"
    fill_in :email, with: user1.email
    fill_in :password, with: user1.password
    click_on "LogIn"
    click_on "Viewing Party"

    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'has a link to return to home page' do
    visit "/"

    click_on("Viewing Party")
    expect(current_path).to eq("/")
  end

  it 'if you are a visitor it has a button to log in' do
    visit "/"

    expect(page).not_to have_link("Log out")
    click_on("Login")
    expect(current_path).to eq("/login")
  end

  it 'has a button to log out if you are logged in' do
    user = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "LogIn"
    click_on "Viewing Party"
    expect(page).not_to have_link("Login")
    expect(page).to have_link("Log Out")
  end

  it 'allows a user to log out' do
    user = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "LogIn"
    click_on "Viewing Party"
    click_on "Log Out"
    expect(page).to have_link("Login")
    expect(page).not_to have_link("Log Out")
  end

  it 'takes a user to their dashboard if password is right' do
    user = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")

    visit("/login")

    fill_in(:email, with: "joe@mail.com")
    fill_in(:password, with: "secret")
    click_on("LogIn")
    expect(current_path).to eq("/dashboard")
  end

  it 'does not allow a sign in with the wrong password' do
    user = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")

    visit("/login")

    fill_in(:email, with: "joe@mail.com")
    fill_in(:password, with: "secretss")
    click_on("LogIn")

    expect(current_path).to eq("/login")
    expect(page).to have_content("Email or password are incorrect")
  end

  it 'needs a valid email to login' do
    user = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")

    visit("/login")

    fill_in(:email, with: "joey@mail.com")
    fill_in(:password, with: "secrets")
    click_on("LogIn")

    expect(current_path).to eq("/login")
    expect(page).to have_content("Email or password are incorrect")
  end

  it 'does not show existing users to a visitor' do
    user1 = User.create!(name: "Joe", email: "joe@mail.com", password: "secret", password_confirmation: "secret")
    user2 = User.create!(name: "Amy", email: "amy@mail.com", password: "test", password_confirmation: "test")

    visit "/"
    expect(page).not_to have_content(user1.name)
    expect(page).not_to have_content(user2.name)

    click_on("Login")
    fill_in :email, with: user1.email
    fill_in :password, with: user1.password
    click_on("LogIn")
    click_on("Viewing Party")

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
    expect(page).not_to have_link(user1.name)
    expect(page).not_to have_link(user2.name)
  end

  it 'has a button to discover movies for visitors' do
    visit '/'

    click_on 'Discover Movies'
    expect(current_path).to eq('/discover')
  end
end
