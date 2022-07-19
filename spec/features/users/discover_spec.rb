# frozen_string_literal: true

require 'rails_helper'

describe 'user discover page' do
  before do
    @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 
      'test123')
      visit '/login'
  
      fill_in :email, with: 'eleven@upsidedown.com'
      fill_in :password, with: 'test123'
 
      click_button 'Log In'
    visit "/discover"
  end

  it 'has a button to discover top rated movies', :vcr do
    click_button('Find Top Rated Movies')

    expect(current_path).to eq("/movies")
    expect(page).to have_content('Top Rated Movies')
    expect(page).to have_content('The Shawshank Redemption')

    expect(page).to_not have_content('Movie results for:')
  end

  it 'has a text field to enter a keyword and a button to search by movie title ', :vcr do
    fill_in 'search', with: 'titanic'
    click_button('Find Movies')

    expect(current_path).to eq("/movies")
    expect(page).to have_content('Movie results for: titanic')
    expect(page).to have_content('Titanic 666')
  end

  it 'displays an error if there was not a valid search input', :vcr do
    fill_in 'search', with: '   '
    click_button('Find Movies')

    expect(current_path).to eq("/discover")
    expect(page).to have_content('Uh oh, something went wrong. Please try again.')
  end
end
