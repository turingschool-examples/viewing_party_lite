# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Details' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g', password: 'test123')

    visit "/users/#{@eli.id}/movies/550"
  end

  it 'can retrieve a movies details', vcr: 'movie_details' do
    expect(page).to have_content('Fight Club')
    expect(page).to have_content('Vote Average: 8.4')
    expect(page).to have_content('Runtime: 2 hr 19 min')
    expect(page).to have_content('Drama')
    expect(page).to have_content('Summary: A ticking-time-bomb')
  end
end
