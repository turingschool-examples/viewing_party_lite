require 'rails_helper'

RSpec.describe "New User", type: :feature do
  it 'has a form to create new user' do
    visit "/users/register"

    fill_in(:name, with: "Jim")
    fill_in(:email, with: "Jim@mail.com")
    fill_in(:password, with: "password")
    fill_in(:password_confirmation, with: "password")
    click_on "Register"
    new_user = User.last

    expect(current_path).to eq("/users/#{new_user.id}")
  end

  it 'rejects duplicate emails' do
    visit "/users/register"

    User.create!(name: "Tim", email: "Jim@mail.com", password: "password", password_confirmation: "password")

    fill_in(:name, with: "Jim")
    fill_in(:email, with: "Jim@mail.com")
    fill_in(:password, with: "password")
    fill_in(:password_confirmation, with: "password")
    click_on "Register"

    expect(current_path).to eq("/users/register")
    expect(page).to have_content("Email has already been taken")
  end

  it 'rejects it if the two passwords do not match' do
    visit "/users/register"

    fill_in(:name, with: "Jim")
    fill_in(:email, with: "Jim@mail.com")
    fill_in(:password, with: "password")
    fill_in(:password_confirmation, with: "passworddd")
    click_on "Register"

    expect(current_path).to eq("/users/register")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
