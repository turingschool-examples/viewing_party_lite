require 'rails_helper'

RSpec.describe 'User Movies Show Page' do
  it 'has a button to create a viewing party' do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit "users/#{user.id}/movies/#{movie.movie_id}"

    click_button('Create Viewing Party')

    expect(current_path).to eq("/users/#{user.id}/movies/#{movie.movie_id}/viewing_party/new")
  end

  it 'has a button to return to discover page' do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)
    visit "/users/#{user.id}/movies/#{movie.movie_id}"

    click_button('Discover Top Rated Movies')
    expect(current_path).to eq("/user/#{user.id}/discover")
  end
end
