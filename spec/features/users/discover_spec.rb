require 'rails_helper'

RSpec.describe 'Movies Discover Page', type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}

  it 'has a button to discover top rated movies', :vcr do
    visit user_discover_path("#{users[0].id}")

    click_button('Top Rated Movies')
    expect(current_path).to eq("/users/#{users[0].id}/movies")
    expect(page).to have_content("Shawshank Redemption")
  end

  it 'has a text field to enter keywords to search by movie title and a button to search', :vcr do
    visit user_discover_path("#{users[0].id}")

    expect(page).to have_field('Movie Title')
    expect(page).to have_button('Search')
  end

  it 'can search for movies by title', :vcr do
    visit user_discover_path("#{users[0].id}")
    fill_in 'Movie Title', with: "Shawshank"
    click_button 'Search'
    expect(current_path).to eq(user_movies_path("#{users[0].id}"))
    expect(page).to have_content('The Shawshank Redemption')
  end
end