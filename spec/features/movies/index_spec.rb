require "rails_helper"

RSpec.describe "Movies Index" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org", password: "password123", password_confirmation: "password123")
    visit "/users/#{@user_1.id}/discover"
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

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  it "has links to movie show pages" do
    click_button "Top Movies"

    click_link "The Shawshank Redemption"

    expect(current_path).to eq("/users/#{@user_1.id}/movies/278")
  end
end
