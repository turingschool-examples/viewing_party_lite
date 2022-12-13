require 'rails_helper'

RSpec.describe 'movies index' do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
  end

  it 'has the title as a link to the movie details page from top rated movies', :vcr do
    visit user_discover_index_path(@user_1)

    expect(page).to have_button("Find Top Rated Movies")

    click_on "Find Top Rated Movies"

    expect(page.status_code).to eq(200)
    expect(page).to have_link("The Godfather")
    expect(page).to have_link("20th Century Girl")
    expect(page).to_not have_link("Finding Nemo")
  end

  it 'has the vote average for the movie from the top rated movies', :vcr do
    visit user_discover_index_path(@user_1)

    expect(page).to have_button("Find Top Rated Movies")

    click_on "Find Top Rated Movies"

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Vote average: 8.7")
  end

  it 'has the title as a link to the movie details page from search field', :vcr do
    visit user_discover_index_path(@user_1)

    expect(page).to have_field(:search)
    expect(page).to have_button("Find Movies")
    
    fill_in :search, with: "Nemo"
    click_on "Find Movies"

    expect(page.status_code).to eq(200)
    expect(page).to have_link("Finding Nemo")
    expect(page).to have_link("Little Nemo")
    expect(page).to_not have_link("20th Century Girl")
  end

  it 'has the vote average for the movie from the search field', :vcr do
    visit user_discover_index_path(@user_1)

    expect(page).to have_field(:search)
    expect(page).to have_button("Find Movies")
    
    fill_in :search, with: "Nemo"
    click_on "Find Movies"

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Vote average: 7.8")
  end

  it 'has a link to the movies show page', :vcr do
    VCR.insert_cassette "movie_discover"
    visit user_discover_index_path(@user_1)

    expect(page).to have_button("Find Top Rated Movies")
    click_on "Find Top Rated Movies"

    VCR.insert_cassette "movie_show_page"
    
    expect(page.status_code).to eq(200)
    expect(page).to have_link("The Godfather")
    
    click_on "The Godfather"
    expect(current_path).to eq(user_movie_path(@user_1, 238))
    VCR.eject_cassette
    VCR.eject_cassette
  end
end