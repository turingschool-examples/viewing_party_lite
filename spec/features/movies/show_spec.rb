require "rails_helper"

RSpec.describe "Movies Show Page" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org", password: "password123", password_confirmation: "password123")
    visit "/login"
    fill_in :email, with: @user_1.email
    fill_in :password, with: @user_1.password
    click_button "Log In"
    visit "/movies/278"
  end

  it "has button to create viewing party" do
    click_on "Create Viewing Party"

    expect(current_path).to eq("/movies/278/viewing_party/new")
  end

  it "has button leading to discover page" do
    click_on "Discover Movies"

    expect(current_path).to eq("/discover")
  end
end
