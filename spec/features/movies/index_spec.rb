require "rails_helper"

RSpec.describe "Movies Index" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org", password: "password123", password_confirmation: "password123")
    visit "/login"
    fill_in :email, with: @user_1.email
    fill_in :password, with: @user_1.password
    click_button "Log In"
    visit "/discover"
  end

  it "lists movie title and vote average" do
    click_button "Top Movies"

    within("#278") do
      expect(page).to have_content("Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
    end
  end

  it "has a button leading back to discover page" do
    click_button "Top Movies"

    click_button "Discover Page"

    expect(current_path).to eq("/discover")
  end

  it "has links to movie show pages" do
    click_button "Top Movies"

    click_link "The Shawshank Redemption"

    expect(current_path).to eq("/movies/278")
  end
end
