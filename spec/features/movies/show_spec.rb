require "rails_helper"

RSpec.describe "Movies Show Page" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")

    visit "/users/#{@user_1.id}/movies/278"
  end

  it "has button to create viewing party" do
    click_on "Create Viewing Party"

    expect(current_path).to eq("/users/#{@user_1.id}/movies/278/viewing_party/new")
  end

  it "has button leading to discover page" do
    click_on "Discover Movies"

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end
end
