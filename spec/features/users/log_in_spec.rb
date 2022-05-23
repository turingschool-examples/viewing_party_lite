require "rails_helper"

RSpec.describe "Log In Page" do
  it "logs in with valid credentials" do
    user = User.create(name: "Unreal Ursa", email: "thisaintreal@gotcha.org", password: "password123", password_confirmation: "password123")

    visit root_path

    click_on "Log In"
    expect(current_path).to eq("/login")

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome, #{user.email}")
  end

  it "can't log in with bad credentials" do
    user = User.create(name: "Unreal Ursa", email: "thisaintreal@gotcha.org", password: "password123", password_confirmation: "password123")

    visit "/login"

    fill_in :email, with: user.email
    fill_in :password, with: "zzzz"
    click_button "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end
