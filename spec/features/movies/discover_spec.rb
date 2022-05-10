require 'rails_helper'

describe "Movies discover page" do
  before do
    @user1 = User.create!(name: "User One", email: "user1@test.com")
    visit "/users/#{@user1.id}/discover"
  end

  it "has a button to discover top rated movies" do
    expect(page).to have_button("Discover top rated movies")
  end

  it "has a search bar/button" do
    expect(page).to have_field("Search")

    expect(page).to have_button("Search")
  end
end
