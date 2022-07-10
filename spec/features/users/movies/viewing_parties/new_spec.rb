require 'rails_helper'

RSpec.describe 'Viewing Party New Page' do
  it 'Has a form to create a new viewing party', :vcr do
    user = User.create!(name: 'User', email: 'user@email.com')
    User.create!(name: 'Tom Marryway', email: 'gloop@email.com')
    User.create!(name: 'Jessica Marryway', email: 'kloop@email.com')
    User.create!(name: 'Sam Marryway', email: 'floop@email.com')
    movie = MoviesFacade.movie(550)

    visit new_user_movie_viewing_party_path(user_id: user.id, movie_id: movie.movie_id)

    expect('Fight Club').to appear_before('Duration')

    fill_in :duration, with: '200'
    fill_in :date, with: '07/10/2022'
    fill_in :time, with: '11:59'

    all('input[type=checkbox]').each do |checkbox|
      checkbox.click
    end

    click_on('Create Viewing Party')

    expect(current_path).to eq(user_path(id: user.id))

    expect(page).to have_content('Movie: Fight Club')

    expect(page).to have_content('Movie: Fight Club')

    expect(page).to have_content('Movie: Fight Club')
  end
end
