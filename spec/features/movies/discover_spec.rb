require "rails_helper"

describe "Movies discover page" do
  before do
    @user1 = User.create!(name: "User One", email: "user1@test.com")
    visit "/users/#{@user1.id}/discover"
  end

  it "has a button to discover top rated movies", :vcr do
    expect(page).to have_button("Discover top rated movies")

    click_button("Discover top rated movies")

    expect(current_path).to eq("/users/#{@user1.id}/discover")

    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_link("The Dark Knight")
    expect(page).to have_content("Vote Average: 8.5")
  end

  it "has a search bar/button", :vcr do
    expect(page).to have_field("q")
    expect(page).to have_button("Search by Title")

    fill_in "q", with: "Nothing"
    click_button("Search by Title")
    expect(current_path).to eq("/users/#{@user1.id}/discover")

    expect(page).to have_link("Nothing to Lose")
    expect(page).to have_content("Vote Average: 6.4")
    expect(page).to have_link("Out of Nothing")
    expect(page).to have_content("Vote Average: 8.3")
  end
end
