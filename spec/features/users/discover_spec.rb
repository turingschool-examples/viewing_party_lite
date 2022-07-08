# frozen_string_literal: true

require 'rails_helper'

describe 'user discover page' do
  before do
    @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com')
    visit "users/#{@user1.id}/discover"
  end

  it 'has a button to discover top rated movies', :vcr do
    click_button('Find Top Rated Movies')

    expect(current_path).to eq("/users/#{@user1.id}/movies")
    expect(page).to have_content('Top Rated Movies')
    expect(page).to have_content('The Shawshank Redemption')

    expect(page).to_not have_content('Movie results for:')
  end

  it 'has a text field to enter a keyword and a button to search by movie title ', :vcr do
    fill_in 'search', with: 'titanic'
    click_button('Find Movies')

    expect(current_path).to eq("/users/#{@user1.id}/movies")
    expect(page).to have_content('Movie results for: titanic')
    expect(page).to have_content('Titanic 666')
  end

  it 'can be returned to from the movie results page', :vcr do
    click_button('Find Top Rated Movies')

    expect(current_path).to eq("/users/#{@user1.id}/movies")
    
    click_button('Discover Page')

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end
end
