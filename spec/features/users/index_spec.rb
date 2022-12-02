require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  before :each do
    visit discover_path(user1)
  end

  it 'has a button to find top rated movies', :vcr do
    expect(page).to have_content('Discover Movies')
    expect(page).to have_button('Find Top Rated Movies')

    click_button('Find Top Rated Movies')

    expect(current_path).to eq(user_movies_path(user1))
  end

  it 'shows the top 20 movies when Top Rated Movies button is pressed', :vcr do
    click_button('Find Top Rated Movies')

    expect(page).to have_content('The Godfather')
    expect(page).to have_content('The Shawshank Redemption')
    expect(page).to_not have_content('Suicide Squad')
  end

  it 'has links on each title to the movies show page', :vcr do
    click_button('Find Top Rated Movies')

    expect(page).to have_link('The Godfather')
    click_link('The Godfather')

    expect(current_path).to eq(user_movie_path(user1, 238))
  end

  it 'has a search bar with submit button to find movies' do
    expect(page).to have_button('Find Movies')

    fill_in('search', with: 'Suicide Squad')
    click_button('Find Movies')
    expect(page).to have_content('Suicide Squad')
    expect(page).to have_content('Vote Average: 5.91')
    expect(page).to_not have_content('Superman')
  end
end
