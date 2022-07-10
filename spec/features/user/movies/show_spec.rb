require 'rails_helper'

RSpec.describe "Movie details/show page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
  end

  it 'has button to create a viewing party', :vcr do
    visit "/users/#{@user1.id}/movies/238"

    expect(page).to have_button("Create Viewing Party")
    expect(page).to have_button("Discover Page")
  end

  it 'discover page button routes to discover page', :vcr do

    visit "/users/#{@user1.id}/movies/238"

    click_button("Discover Page")

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  xit 'create viewing party button routes to new viewing party page', :vcr do
    visit "/users/#{@user1.id}/movies/238"

    click_button("Create Viewing Party")

    expect(current_path).to eq("/users/#{@user1.id}/movies/238/viewing-party/new")
  end

  it 'displays movie details', :vcr do
    godfather = MovieFacade.create_movie_details(238)

    visit "/users/#{@user1.id}/movies/238"

    expect(page).to have_content(godfather.title)
    expect(page).to have_content(godfather.vote_average)
    expect(page).to have_content(godfather.runtime)
    expect(page).to have_content("Drama, Crime")
    expect(page).to have_content(godfather.overview)
  end
end
