require 'rails_helper'

RSpec.describe "User Discover" do
  it "has link to top rated movies, and section to search by name" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    expect(page).to have_link("Top Rated Movies")
    expect(page).to have_field("Search")
    expect(page).to have_button("Search")
  end

  it "links to top rated movies" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    click_link "Top Rated Movies"

    expect(path).to ("/users/#{user_1.id}/movies?q=top%20rated")
  end

  it "Can search movies by name" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    fill_in "Search", with: "Titanic"
    click_button "Search"

    expect(page).to have_current_path("/users/#{user_1.id}/movies?q=Titanic")
    expect(page).to have_content("Titanic 666")
  end
end
