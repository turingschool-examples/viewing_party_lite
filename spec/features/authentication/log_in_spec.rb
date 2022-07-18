require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(email: "test@gmail.com", password: "test", name: 'Bob')

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(page).to have_content("Welcome, #{user.email}")
  end

  it "cannot log in with bad credentials" do
  user = User.create(email: "test@gmail.com", password: "test", name: 'Bob')

  visit login_path

  fill_in :email, with: user.email
  fill_in :password, with: "incorrect password"

  click_on "Log In"

  expect(current_path).to eq(login_path)

  expect(page).to have_content("Sorry, invalid login.")
end
end