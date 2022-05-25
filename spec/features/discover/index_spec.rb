require "rails_helper"

RSpec.describe "Discover Page" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org", password: "password123", password_confirmation: "password123")
    visit "/login"
    fill_in :email, with: @user_1.email
    fill_in :password, with: @user_1.password
    click_button "Log In"
    visit "/discover"
  end

  it "has a button leading to most popular movies (movies results page)", :vcr do
    click_button "Top Movies"

    expect(current_path).to eq("/movies")
  end

  it "has a Search button leading to (movies results page)", :vcr do
    fill_in :keyword, with: "tropic thunder"
    click_button "Search"

    expect(current_path).to eq("/movies")
  end
end
