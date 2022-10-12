require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }

  it 'has a links to movie details', :vcr do
    visit user_discover_path(user1)

    click_on 'Find Top Rated Movies'
    click_on 'The Godfather'

    expect(current_path).to eq(user_movie_path(user1, 238))
    expect(page).to have_content('The Godfather')
    expect(page).to have_button('Discover Page')
  end

  it 'links to discover page' do
    visit user_movie_path(user1, 238)

    click_on 'Discover Page'

    expect(current_path).to eq(user_discover_path(user1))
  end

  it 'displays header info' do
    visit user_movie_path(user1, 238)

    within("#header_info") do
      expect(page).to have_content('Vote Average: 8.7')
      expect(page).to have_content('Runtime: 2 hr 55 min')
      expect(page).to have_content('Genre(s): Drama and Crime')
    end
  end

  it 'displays a summary' do
    visit user_movie_path(user1, 238)

  end
end