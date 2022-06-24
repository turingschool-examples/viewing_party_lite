require 'rails_helper'

RSpec.describe "New User", type: :feature do
  it 'has a form to create new user' do
    visit "/register"
    within ".area_container" do
      fill_in(:name, with: "Jim")
      fill_in(:email, with: "Jim@mail.com")
      fill_in(:password, with: "password")
      fill_in(:password_confirmation, with: "password")
      click_on "Register"
    end
    new_user = User.last

    expect(current_path).to eq("/dashboard")
  end

  it 'rejects duplicate emails' do
    visit "/register"

    User.create!(name: "Tim", email: "Jim@mail.com", password: "password", password_confirmation: "password")

    within ".area_container" do
      fill_in(:name, with: "Jim")
      fill_in(:email, with: "Jim@mail.com")
      fill_in(:password, with: "password")
      fill_in(:password_confirmation, with: "password")
      click_on "Register"
    end

    expect(current_path).to eq("/register")
    expect(page).to have_content("Email has already been taken")
  end

  it 'rejects it if the two passwords do not match' do
    visit "/register"

    within ".area_container" do
      fill_in(:name, with: "Jim")
      fill_in(:email, with: "Jim@mail.com")
      fill_in(:password, with: "password")
      fill_in(:password_confirmation, with: "passworddd")
      click_on "Register"
    end

    expect(current_path).to eq("/register")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'requires a password confirmation to create a user' do
    visit "/register"

    within ".area_container" do
      fill_in(:name, with: "Jim")
      fill_in(:email, with: "Jim@mail.com")
      fill_in(:password, with: "password")
      click_on "Register"
    end

    expect(current_path).to eq("/register")
    expect(page).to have_content("Password confirmation can't be blank")
  end

  it 'has an error if you fail to enter your name' do
    visit "/register"

    within ".area_container" do
      fill_in(:email, with: "Jim@mail.com")
      fill_in(:password, with: "password")
      fill_in(:password_confirmation, with: "password")
      click_on "Register"
    end

    expect(current_path).to eq("/register")
    expect(page).to have_content("Name can't be blank")
  end

  it 'email cannot be blank' do
    visit "/register"

    within ".area_container" do
      fill_in(:name, with: "Jim")
      fill_in(:password, with: "password")
      fill_in(:password_confirmation, with: "password")
      click_on "Register"
    end

    expect(current_path).to eq("/register")
    expect(page).to have_content("Email can't be blank")
  end
end
