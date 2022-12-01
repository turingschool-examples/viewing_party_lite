require 'rails_helper'

RSpec.describe 'movies index' do
  before :each do
    @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com')
    @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com')
  end

  it 'has the title as a link to the movie details page from top rated movies', :vcr do
    visit user_discover_index_path(@user_1)

    expect(page).to have_button("Find Top Rated Movies")

    click_on "Find Top Rated Movies"

    expect(page.status_code).to eq(200)
    expect(page).to have_content("The Godfather")
    expect(page).to have_content("20th Century Girl")
    expect(page).to_not have_content("Finding Nemo")
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
    expect(page).to have_content("Finding Nemo")
    expect(page).to have_content("Little Nemo")
    expect(page).to_not have_content("20th Century Girl")
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
end