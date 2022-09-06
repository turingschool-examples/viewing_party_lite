require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    drew = User.create!(name: "Drew", email: "dmacdev@gmail.com", password: '123456', password_confirmation: '123456')

    visit root_path

    click_on "Log In"

    expect(current_path).to eq('/login')

    fill_in :email, with: drew.email
    fill_in :password, with: drew.password

    click_on "Log In"

    expect(current_path).to eq("/users/#{drew.id}")

    expect(page).to have_content("Welcome, #{drew.name}")
  end
  it "cannot log in with bad credentials" do
    drew = User.create!(name: "Drew", email: "dmacdev@gmail.com", password: '123456', password_confirmation: '123456')

    visit '/login'

    fill_in :email, with: drew.email
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq('/login')

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end
