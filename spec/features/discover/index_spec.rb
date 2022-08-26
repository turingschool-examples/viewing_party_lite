# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'discover index page', type: :feature do
  it 'has button for top rated movies', :vcr do
    user1 = User.create!(name: 'nicole', email: 'nicole@turing.com')
    visit user_discover_index_path(user1)
    click_button 'Find Top Rated Movies'
    expect(current_path).to eq(user_movies_path(user1))
    expect(page).to have_content('Spirited Away')
    expect(page).to have_content('Pulp Fiction')
  end

  it 'has text field and button to search a movie', :vcr do
    user1 = User.create!(name: 'nicole', email: 'nicole@turing.com')
    visit user_discover_index_path(user1)
    fill_in :search, with: 'Gump'
    click_button 'Find Movies'
    expect(current_path).to eq(user_movies_path(user1))
    expect(page).to have_content('Forrest Gump')
    expect(page).to have_content('Gump & Co.')
  end
end
