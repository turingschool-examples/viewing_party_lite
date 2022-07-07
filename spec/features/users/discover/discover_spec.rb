require 'rails_helper'

RSpec.describe "User Discover" do
  it "has link to top rated movies, and section to search by name" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    expect(page).to have_link("Top Rated Movies")
    expect(page).to have_field("Search By Movie Title")
    expect(page).to have_button("Search")
  end

  it "links to top rated movies" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    click_link "Top Rated Movies"

    expect(current_path).to eq("/users/#{user_1.id}/movies?q=top%20rated")
  end

  it "links to top rated movies" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    fill_in "Search By Movie Title", with: "Titanic"
    click_button "Search"

    expect(current_path).to eq("/users/#{user_1.id}/movies?q=Titanic")
  end
end
