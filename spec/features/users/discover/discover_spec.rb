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

    expect(current_path).to eq("/users/#{user_1.id}/movies")
    expect(page).to have_link("Shawshank Redemption")
    expect(page).to_not have_content("Dumb and Dumber")#sadly

    click_link "Shawshank Redemption"
    expect(current_path).to eq("/movies/#{movie.id}/show")
  end

  it "Can search movies by name" do
    user_1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")

    visit "/users/#{user_1.id}/discover"

    fill_in "Search", with: "Titanic"
    click_button "Search"

    expect(current_path).to eq("/users/#{user_1.id}/movies")
    expect(page).to have_link("Titanic 666")
    expect(page).to_not have_content("Shawshank Redemption")

    click_link "Titanic 666"

    expect(current_path).to eq("movies/#{movie.id}/show")
  end
end
