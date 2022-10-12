require 'rails_helper' 

RSpec.describe 'Discover Movies page' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }

  it 'link directs to the discover page' do
    visit user_dashboard_path(user1)

    click_on 'Discover Movies'

    expect(current_path).to eq(user_discover_path(user1))
  end

  it 'link directs to the discover page' do
    visit user_discover_path(user1)

    expect(page).to have_content("Discover Movies")
  end

  it 'has button for top rated movies' do
    visit user_discover_path(user1)

    expect(page).to have_button('Find Top Rated Movies')

    click_on 'Finde Top Rated Movies'

    expect(current_path).to eq(user_movies(user1))
  end

  it 'has text field to search for movies' do
    visit user_discover_path(user1)

    expect(page).to have_button('Find Movies')
    expect(page).to have_field('Search by movie title')

    click_on 'Find Movies'

    expect(current_path).to eq(user_movies(user1))
  end
end