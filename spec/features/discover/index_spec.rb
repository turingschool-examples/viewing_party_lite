require "rails_helper"

RSpec.describe "Discover Page" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")
    visit "/users/#{@user_1.id}/discover"
  end

  it "has a button leading to most popular movies (movies results page)" do
    click_button "Top Movies"

    expect(current_path).to eq("/users/#{@user_1.id}/movies")
  end

  it "has a Search button leading to (movies results page)" do
    fill_in :keyword, with: "Tropic Thunders"
    click_button "Search"

    expect(current_path).to eq("/users/#{@user_1.id}/movies")
  end
end
