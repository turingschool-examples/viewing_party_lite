require 'rails_helper'

RSpec.describe 'User Movies Show Page From Results', :vcr do

  before :each do
    @user1 = User.create(name: "Jake", email: "imjakekim@gmail.com")
  end

  it 'has required fixed content' do
    visit "/users/#{@user1.id}/movies/238"
    expect(page).to have_button("Discover Page")
    expect(page).to have_button("Create Viewing Party")
    expect(page).to have_content("Vote Average:")
    expect(page).to have_content("Runtime:")
    expect(page).to have_content("Genre(s):")
    expect(page).to have_content("Summary")
    expect(page).to have_content("Cast")
  end

  it 'has required varying content' do
    visit "/users/#{@user1.id}/movies/238"

    expect(page).to have_button("Create Viewing Party for The Godfather")
    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("Author: crastana")
    expect(page).to have_content("Author: futuretv")
    expect(page).to have_content("The Godfather Review by Al Carlson")
    expect(page).to have_content("A masterpiece by the young and talented Francis")
  end

  it 'can use button to return to discover page' do
    visit "/users/#{@user1.id}/movies/238"
    click_button 'Discover Page'

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'can use button to reach new viewing party' do
    visit "/users/#{@user1.id}/movies/238"
    click_button 'Create Viewing Party for The Godfather'

    expect(current_path).to eq("/users/#{@user1.id}/movies/238/viewing_party/new")
  end

end
