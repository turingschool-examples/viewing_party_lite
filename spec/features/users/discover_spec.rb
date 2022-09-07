# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g', password: 'test123')

    visit "/users/#{@eli.id}/discover"
  end

  it 'has top rated button', vcr: 'top_rated' do
    expect(page).to have_button('Find Top Rated Movies')
    click_button('Find Top Rated Movies')
    expect(current_path).to eq("/users/#{@eli.id}/movies")
  end

  it 'has search field and button', vcr: 'search_phoenix' do
    fill_in 'q', with: 'phoenix'
    expect(page).to have_button('Find Movies')
    click_button('Find Movies')
    expect(current_path).to eq("/users/#{@eli.id}/movies")
    expect(page).to have_content('Movie Results for: phoenix')
  end
end
