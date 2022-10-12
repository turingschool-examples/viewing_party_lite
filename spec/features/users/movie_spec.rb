require 'rails_helper'

RSpec.describe 'Movie Index Page' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }

  it 'is linked from user discover page' do
    visit user_discover_path(user1)

    click_on 'Find Top Rated Movies'

    expect(current_path).to eq(user_movies_path(user1))

    visit user_discover_path(user1)
    fill_in :q, with: 'wayne'
    click_on 'Find Movies'

    expect(current_path).to eq(user_movies_path(user1))
  end

  it 'displays top forty movies'do
    VCR.use_cassette('displays_top_forty_movies') do
      visit user_discover_path(user1)

      click_on 'Find Top Rated Movies'

      expect(page).to have_link("The Godfather")
    end
  end

  it 'displays the searched movies' do
    VCR.use_cassette('returns_movies_from_search') do
      visit user_discover_path(user1)
      fill_in :q, with: 'wayne'
      click_on 'Find Movies'

      expect(page).to have_content("Wayne")
    end
  end

  it 'has button to return to discover page' do
    visit user_discover_path(user1)

    click_on 'Find Top Rated Movies'

    expect(page).to have_button('Discover Page')

    click_on 'Discover Page'

    expect(current_path).to eq(user_discover_path(user1))
  end

  it 'has a links to movie details', :vcr do
    visit user_discover_path(user1)

    click_on 'Find Top Rated Movies'
    click_on 'The Godfather'

    expect(current_path).to eq(user_movie_path(user1, 238))
    expect(page).to have_content('The Godfather')
    expect(page).to have_link('Discover Page')
  end
end