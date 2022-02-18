require 'rails_helper'

RSpec.describe "Welcome Page" do
  before :each do
    visit "/"
  end
  it 'displays the name of the application' do
    expect(page).to have_content("Viewing Party Lite")
  end

  it 'displays a button to create a new user' do
    expect(page).to have_button("Create User")
  end

  it 'the create user button to the correct path' do
    click_on "Create User"

    expect(current_path).to eq("/register")
  end

  #removed this test as we are incorporating logins

  # it 'lists existing users with a link for their dashboard' do
  #   carol = User.create!(username: "Carol", email: "carol@gmail.com", password: "1234")
  #   timmy = User.create!(username: "Timmy", email: "timmy@gmail.com", password: "5678")
  #   visit "/"
  #   expect(page).to have_link("carol@gmail.com's Dashboard")
  #   expect(page).to have_link("timmy@gmail.com's Dashboard")
  #
  #   click_on "carol@gmail.com's Dashboard"
  #
  #   expect(current_path).to eq("/dashboard")
  # end

  it 'displays a link at the top to return users back to the landing page' do
    expect(page).to have_link("Home")
    expect("Home").to appear_before("Viewing Party Lite")

    click_on "Home"
    expect(current_path).to eq("/")
  end

  it 'displays a link for current users to login' do
    user = User.create(username: "jeffy", email: "jeffy@123.com", password: "rocks", password_confirmation: "rocks")

    click_on "Login"
    expect(current_path).to eq("/login")

    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Log In'

    expect(current_path).to eq("/dashboard")

  end

  it 'no longer displays a login/register button after logging in' do
    user = User.create(username: "jeffy", email: "jeffy@123.com", password: "rocks", password_confirmation: "rocks")
    click_on "Login"
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Log In'

    visit "/"

    expect(page).to have_link("Log Out")
    expect(page).to_not have_content("Login")
    expect(page).to_not have_content("Create User")
  end

  it "removes the log out link after clicking and login/register reappears" do
    user = User.create(username: "jeffy", email: "jeffy@123.com", password: "rocks", password_confirmation: "rocks")
    click_on "Login"
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Log In'

    visit "/"

    click_on 'Log Out'

    expect(page).to have_content("Login")
    expect(page).to have_button("Create User")
    expect(page).to_not have_content("Log Out")
  end
  describe 'Sad Paths' do
    it 'displays a link for current users to login' do
      user = User.create(username: "jeffy", email: "jeffy@123.com", password: "rocks", password_confirmation: "rocks")

      click_on "Login"
      expect(current_path).to eq("/login")

      fill_in 'username', with: user.username
      fill_in 'password', with: "marbles"
      click_on 'Log In'
      expect(page).to have_content("Password is not correct")
      expect(current_path).to eq("/login")
    end
  end
end
