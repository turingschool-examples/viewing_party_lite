require 'rails_helper'

RSpec.describe 'sessions' do

  it "has a logout button instead of login/register if already logged in" do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    visit login_path
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'Isuck'
    click_button "Login"

    visit root_path
    expect(page).to_not have_button("Login")
    expect(page).to_not have_button("Create New User")

    expect(page).to have_button("Logout")
  end

  it "can logout a user" do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    visit login_path
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'Isuck'
    click_button "Login"

    visit root_path
    click_button "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to have_button("Login")
    expect(page).to have_button("Create New User")
  end

  it "shows no users emails when not logged in on homepage" do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')

    visit root_path
    expect(page).to_not have_content("jimar@jimar.com")
    expect(page).to_not have_content('NickT@jimar.com')

  end

  it "shows the email adddress for all registered users" do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')

    visit login_path
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'Isuck'
    click_button "Login"

    visit root_path
    expect(page).to have_content('jimar@jimar.com')
    expect(page).to have_content('NickT@jimar.com')
  end

  it "gives an error message when trying to access dashboard without being logged in" do
    visit '/users/dashboard'
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You must be logged in to access your dashboard")
  end

  it "gives you an error/redirect when trying to create a new view party without logging in", :vcr do

    visit '/users/movies/550'
    click_button("Create Viewing Party")
    
    expect(current_path).to eq('/users/movies/550')
    expect(page).to have_content("You must be logged in to create a viewing party")
  end
end
