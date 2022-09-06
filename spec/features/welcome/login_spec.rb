require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create!(name: "Drew", email: "goodtimes@good.com", password: "password123")

    visit '/'

    click_button "Log In"

    expect(current_path).to eq('/login')

    fill_in 'Email:', with: user.email
    fill_in 'Password:', with: user.password

    click_button "Log In"

    expect(current_path).to eq("/users/#{user.id}")

    expect(page).to have_content("Welcome, #{user.name}")
  end

  it "cannot log in with bad credentials" do
  user = User.create!(name: "Drew", email: "goodtimes@good.com", password: "password123")

  visit '/login'

  fill_in 'Email:', with: user.email
  fill_in 'Password:', with: "password124"

  click_button "Log In"

  expect(current_path).to eq('/login')

  expect(page).to have_content("Sorry, your credentials are bad.")
end
end
