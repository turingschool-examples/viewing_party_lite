require "rails_helper"

RSpec.describe "user dashboard" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")

    visit "/users/#{@user_1.id}"
  end

  it "displays user name" do
    expect(page).to have_content("Unreal Ursa's Dashboard")
  end

  it "has button that directs to discover page" do
    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end
end
