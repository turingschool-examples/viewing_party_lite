require 'rails_helper'

RSpec.describe "Landing Page" do
  # Context: logged out or new user
  it 'displays title of application' do
    visit '/'
    expect(page).to have_content("Viewing Party")
  end

  it 'has button that links to create new user' do
    visit '/'

    click_button("Create New User")
    expect(current_path).to eq('/register')
  end

  it 'has a link to login, when I click this link I am taken to login page' do
    user_1 = User.create!(name: 'user_1', email: 'test@emailtest.com', password: '1234', password_confirmation: '1234')

    visit root_path

    within '.login' do
      expect(page).to have_button("Login")
      click_button("Login")

      expect(current_path).to eq("/login")
    end
  end

  context 'after logging in' do
    before do

      drew = User.create!(name: "Drew Proebstel", email: "swagmasterd@dopemail.com", password: 'password123', password_confirmation: 'password123')
      alex = User.create!(name: "Alex P", email: "swagmasterp@dopemail.com", password: 'password345', password_confirmation: 'password345')
      gerardo = User.create!(name: "Gerardo R", email: "riverareports@dopemail.com", password: 'password456', password_confirmation: 'password456')

      visit '/login'
      fill_in "Email", with: alex.email.to_s
      fill_in "Password", with: alex.password.to_s
      click_button "Login"
      visit '/'

    end

    it 'displays current user name and email, and other existing users name/email' do
      expect(page).to have_content("Alex P")
      expect(page).to have_content("swagmasterp@dopemail.com")
      expect(page).to have_content("Drew Proebstel")
      expect(page).to have_content("swagmasterd@dopemail.com")
      expect(page).to have_content("Gerardo R")
      expect(page).to have_content("riverareports@dopemail.com")
    end

    it 'no longer displays a button to login' do
      expect(page).to_not have_button "Login"
    end

    it 'no longer displays button to create a new user' do
      expect(page).to_not have_button "Create New User"
    end

    it 'has a link to logout, when I click this link it ends my session and takes me back to the landing page' do
      expect(page).to have_link "Logout"
      click_on "Logout"
      expect(current_path).to eq "/"
      expect(page).to have_button("Login")
      expect(page).to have_button("Create New User")
    end
  end
end
