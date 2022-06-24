require 'rails_helper'


RSpec.describe "Movie Results", type: :feature do
  it 'displays top 20 rated movies', :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Login"

    visit "/movies?q=top%20rated"

    expect(page).to have_content("Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("Dilwale Dulhania Le Jayenge")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Vote Average: 8.7")
  end

  it 'has links to movie detail page', :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Login"

    visit "/movies?q=top%20rated"
    click_link "Shawshank Redemption"

    expect(current_path).to eq("/movies/278")
  end


  it 'has a button to return to the discover page', :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")
    movie = Movie.new(id: 1, title: "Movie", vote_average: "8.2")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Login"

    visit "/movies?q=top%20rated"

    click_on "Discover Movies"
    expect(current_path).to eq("/discover")
  end
end
