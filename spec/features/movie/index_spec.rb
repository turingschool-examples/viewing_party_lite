require 'rails_helper'

RSpec.describe 'movie index spec' do
  let!(:user_1) {User.create!(name: "Alfred", email: "alfred@butler.net", status: 0)}
  let!(:user_2) {User.create!(name: "Bruce", email: "bruced@boss.net", status: 0)}
  let!(:user_3) {User.create!(name: "Oswald", email: "oswald@cobblepot.gotham", status: 0)}
  
  it 'has a link to take the user back to the homepage' do 
    visit user_movie_index_path(user_1)

    click_link "Home"

    expect(current_path).to eq(root_path)
  end

  it 'has a button that takes the user back to the discover page' do 
    visit user_movie_index_path(user_1)

    click_button "Discover Movies"

    expect(current_path).to eq(user_discover_index_path(user_1))
  end

  it 'can show the top 40 movies as links to the show page' do 
    TmdbFacade.top_rated_movies

    visit user_movie_index_path(user_1)

    click_link "The Shawshank Redemption"

    expect(current_path).to eq(user_movie_path(user_1, 278))
  end

  it 'shows the vote average for a movie' do 
    movie = TmdbFacade.top_rated_movies.first

    visit user_movie_index_path(user_1)

    expect(page).to have_content("Vote Average: #{movie.vote_average}")
  end
end