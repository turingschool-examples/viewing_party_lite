require 'rails_helper'

RSpec.describe 'Discover Movies page', type: :feature do
  before :each do
    @user_1 = User.create!(name: 'First User', email: 'firstuser@mail.com')
    visit user_discover_path(@user_1.id)
  end

  it 'user sees Discover Movies title' do
    expect(page).to have_content('Discover Movies')
    expect(current_path).to eq(user_discover_path(@user_1.id))
  end

  it 'has button to discover top rated movies' do
    expect(page).to have_button('Find Top Rated Movies')
  end

  it 'has a search field with text to Search by movie title' do
    expect(page).to have_field('Search by Movie Title')
  end

  it 'has button to search for a movie by name' do
    expect(page).to have_button('Find Movies')
  end
end
