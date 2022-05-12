require "rails_helper"

RSpec.describe "Discover page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com") }

  it "has button to discover top rated movies" do
    visit "/users/#{pabu.id}/discover"

    click_button "Discover Top-Rated Movies"
    expect(current_path).to eq("/users/#{pabu.id}/users/#{pabu.id}/movies")
    expect("The Shawshank Redemption").to appear_before("The Godfather")
  end

  it "can search by title" do
    visit "/users/#{pabu.id}/discover"

    fill_in :title, with: "Shawshank"
    click_button "Search"
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to_not have_content("The Godfather")
  end
end
