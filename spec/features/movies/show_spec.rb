require 'rails_helper'


RSpec.describe "Movie Details Page", type: :feature do
  it "has button to create viewing party", :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Login"

    visit "/movies/278"
    click_button "Create new viewing party"

    expect(current_path).to eq("/movies/278/viewing_party/new")
  end

  it 'cannot create a viewing party for a visitor', :vcr do
    visit "/movies/278"
    click_button "Create new viewing party"

    expect(current_path).to eq("/movies/278")
    expect(page).to have_content("You must be log in or register to create a viewing party")
  end

  it 'has a button to return to the discover page', :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")
    movie = Movie.new(id: 1, title: "Movie", vote_average: "8.2")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Login"

    visit "/movies/#{movie.id}"
    click_on "Return to Discover"
    expect(current_path).to eq("/discover")
  end

  xit 'has all the movie details', :vcr do
    movie_details = File.read("spec/fixtures/movie_details_test.json")
    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")
    visit "/users/#{user.id}/movies/278"
  end
end
