require 'rails_helper'

RSpec.describe 'the movie results page' do
  before (:each) do
    @u1 = User.create!(name: 'Mr 1', email: 'Test1@test.com')
  end

  it 'lists the top 40 movies', :vcr do
    visit "/users/#{@u1.id}/discover"
    click_button "Top Rated Movies"
    expect(current_path).to eq("/users/#{@u1.id}/movies")
    expect(page).to have_content("Top Movies")
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Dilwale Dulhania Le Jayenge")
    expect(page).to have_content("Violet Evergarden: The Movie")

  end

  it 'can search for movies', :vcr do
    visit "/users/#{@u1.id}/discover"
    fill_in :title, with: "Avengers"
    click_button "Search by Title"
    expect(page).to have_content("The Avengers")
    expect(page).to have_content("Avengers: Endgame")
    expect(page).to have_content("Avengers Grimm")
    expect(page).to have_content("Ultimate Avengers 2")
  end
end
