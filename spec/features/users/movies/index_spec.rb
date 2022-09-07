# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies Index' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g', password: 'test123')

    visit "/users/#{@eli.id}/discover"
  end

  it 'has top rated feature', vcr: 'top_rated' do
    click_button('Find Top Rated Movies')
    expect(current_path).to eq("/users/#{@eli.id}/movies")
    expect(page).to have_content('Title: The Shawshank Redemption')
    expect(page).to have_content('Vote Average: 8.7')
  end

  it 'has search feature', vcr: 'search_phoenix' do
    fill_in 'q', with: 'phoenix'
    click_button('Find Movies')
    expect(current_path).to eq("/users/#{@eli.id}/movies")
    expect(page).to have_content('Movie Results for: phoenix')
    expect(page).to have_content('Title: Dark Phoenix')
    expect(page).to have_content('Vote Average: 6')
  end
end
