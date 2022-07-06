require 'rails_helper'

RSpec.describe "login form" do
  before(:each) do
    @user = User.create!(name: "Phillip", email: "phillip@turing.edu", password: "ilovesam")
    visit "/login"
  end

  it "redirects to user dashboard" do
    fill_in(:email, with: @user.email)
    fill_in(:password, with: @user.password)
    click_on "Log In"
    expect(current_path).to eq("/dashboard")
  end

  it "does not work with wrong id" do
    fill_in(:email, with: "phillip@emerson.edu")
    click_on "Log In"
    expect(current_path).to eq("/login")
    expect(page).to have_content("Incorrect Email entered")
  end
end
