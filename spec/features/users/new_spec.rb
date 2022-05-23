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

    User.create!(name: "Tim", email: "Jim@mail.com")

    fill_in(:name, with: "Jim")
    fill_in(:email, with: "Jim@mail.com")
    click_on "Register"

    expect(current_path).to eq("/users/register")
    expect(page).to have_content("Error: User already exists with this email")
  end

end
