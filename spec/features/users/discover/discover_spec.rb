require 'rails_helper'

RSpec.describe "User Discover" do
  xit "has link to top rated movies, and section to search by name" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    expect(page).to have_link("Top Rated Movies")
    expect(page).to have_field("Search By Movie Title")
    expect(page).to have_button("Search")
  end

  xit "links to top rated movies" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    click_link "Top Rated Movies"
    page.reset!
    expect(current_path).to eq("/users/#{user_1.id}/movies?q=top%20rated")
  end

  it "Can search movies by name" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    fill_in "Search", with: "Titanic"
    click_button "Search"

    expect(page).to have_current_path("/users/#{user_1.id}/movies?q=Titanic")
  end
end
