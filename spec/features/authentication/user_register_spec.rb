require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "Create New User"

    expect(current_path).to eq('/register')

    email = "test@gmail.com"
    password = "test"
    name = "Bob"

    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_on "Register"

    expect(page).to have_content("Welcome, #{email}!")
  end
end