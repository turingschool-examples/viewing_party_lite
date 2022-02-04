require 'rails_helper'

RSpec.describe 'movie show page' do
  let!(:user_1) {User.create!(name: "Alfred", email: "alfred@butler.net", status: 0)}
  let!(:user_2) {User.create!(name: "Bruce", email: "bruced@boss.net", status: 0)}
  let!(:user_3) {User.create!(name: "Oswald", email: "oswald@cobblepot.gotham", status: 0)}

  it 'has a link to take the user back to the homepage' do 
    visit user_movie_path(user_1, 278)

    click_link "Home"

    expect(current_path).to eq(root_path)
  end

  it 'has a button that takes the user back to the discover page' do 
    visit user_movie_path(user_1, 278)

    click_button "Discover Movies"

    expect(current_path).to eq(user_discover_index_path(user_1))
  end

  it 'has a button that takes the user to a form to create a new viewing party' do 
    movie = TmdbFacade.details(278)

    visit user_movie_path(user_1, 278)

    click_button "Create Viewing Party for #{movie.title}"

    expect(current_path).to eq(new_user_movie_viewing_party_path(user_1, movie.id))
  end

  it 'shows the movie attributes' do 
    movie = TmdbFacade.details(278)
    reviews = TmdbFacade.reviews(278)
    
    visit user_movie_path(user_1, 278)
    
    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.vote_average)
    expect(page).to have_content(movie.runtime)
    expect(page).to have_content(movie.genres.first)
    expect(page).to have_content(movie.cast.first.first)
    expect(page).to have_content(movie.cast.first.last)
    expect(page).to have_content(reviews.first.author)
    expect(page).to have_content(reviews.first.summary)
  end
end