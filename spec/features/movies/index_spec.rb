require 'rails_helper'

RSpec.describe 'Movies Page', type: :feature do
  it 'displays top 20 movies as links and their vote average' do
    user = User.create!(name: 'Badger', email: 'honey.new@gmail.com', password: 'password')
    visit user_discover_index_path(user.id)

    click_button 'Top Rated Movies'
    expect(current_path).to eq(user_movies_path(user.id))

    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Average Rating: 8.7")
  end

  it 'displays keyword result with link to discover page' do
    user = User.create!(name: 'Badger', email: 'honey.new@gmail.com', password: 'password')
    visit user_discover_index_path(user.id)

    fill_in :q, with: "Rings"
    click_button 'Search'

    expect(current_path).to eq(user_movies_path(user.id))
    expect(page).to have_content('Title', count: 40)
    click_button 'Discover Movies'
    expect(current_path).to eq(user_discover_index_path(user.id))
  end
end