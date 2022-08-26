require 'rails_helper'

RSpec.describe 'Movie Details Page' do
  it 'can retrieve a movies details', vcr: 'movie_details' do
    # Detail page for Fight club
    visit user_movie_path(1, 550)
    expect(page).to have_content('Fight Club')
    expect(page).to have_content('Vote Average: 8.431')
    expect(page).to have_content('Runtime: 2 hr 19 min')
  end
end