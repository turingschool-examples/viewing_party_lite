require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }

  it 'shows the top 40 movies from the API', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit discover_path

    click_button 'Find Top Rated Movies'

    expect(current_path).to eq(movies_path)
    expect(page).to have_css('table#top-movies tr', :count=>41)
    expect(page).to have_content('Shawshank Redemption')
  end

  it 'shows the top 40 movies from the API based on a search string', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit discover_path

    fill_in :q, with: 'spongebob'
    click_button 'Find Movies'

    expect(page.status_code).to eq 200

    # 1 Header row, 40 result rows
    expect(current_path).to eq(movies_path)
    expect(page).to have_content('Movie Results for: spongebob')
    expect(page).to have_css('table#searched-movies-table tr', :count=>41)
  end

  it 'has a link to the show page for movies', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit discover_path

    click_button 'Find Top Rated Movies'

    expect(current_path).to eq(movies_path)
    expect(page).to have_link 'The Shawshank Redemption'

    click_link 'The Shawshank Redemption'

    expect(current_path).to eq("/movies/278")
  end

  it 'has a button to go back to the discover page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit movies_path

    expect(page).to have_button 'Discover Page'
    click_button 'Discover Page'
    expect(current_path).to eq(discover_path)
  end
end
