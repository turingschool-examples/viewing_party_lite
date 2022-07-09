require 'rails_helper'

RSpec.describe 'Viewing Party New Page' do
  it 'Has a form to create a new viewing party', :vcr do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit new_user_movie_viewing_party_path(user_id: user.id, movie_id: movie.movie_id)
    save_and_open_page
    expect('Fight Club').to appear_before('Duration of Party:')

    fill_in :duration_of_party, with: '200'
    fill_in :when, with: '200'
    fill_in :time, with: '200'
    fill_in :checkbox, with: '200'
  end
end
