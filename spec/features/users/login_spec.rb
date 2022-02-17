require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create!(name: "David", email: "david@email.com", password: 'test', password_confirmation: 'test')

    visit root_path

    click_on "Login"

    expect(current_path).to eq('/login')

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Login"

    expect(current_path).to eq("/users/#{user.id}")

    expect(page).to have_content("Welcome, #{user.email}")
  end

  it "cannot log in with bad credentials" do
    user = User.create!(name: "David", email: "david@email.com", password: 'test', password_confirmation: 'test')

    visit login_path

    fill_in :email, with: user.email
    fill_in :password, with: "incorrect password"

    click_on "Login"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end
