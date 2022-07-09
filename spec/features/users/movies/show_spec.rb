require 'rails_helper'

RSpec.describe 'User Movies Show Page' do
  it 'has a button to create a viewing party', :vcr do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit user_movie_path(user_id: user.id, id: movie.movie_id)

    click_button('Create Viewing Party')

    expect(current_path).to eq new_user_movie_viewing_party_path(user_id: user.id, movie_id: movie.movie_id)
  end

  it 'has a button to return to discover page', :vcr do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)
    visit user_movie_path(user_id: user.id, id: movie.movie_id)

    click_button('Discover Top Rated Movies')
    expect(current_path).to eq("/user/#{user.id}/discover")
  end

  it 'displays movie attributes', :vcr do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit user_movie_path(user_id: user.id, id: movie.movie_id)
    expect(page).to have_content('Fight Club')
    expect(page).to have_content('Vote Average: 8.4')
    expect(page).to have_content('Runtime: 2:19')
    expect(page).to have_content('Genre: Drama')
    expect(page).to have_content('Summary Description: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."')
  end

  it 'displays the first ten cast members', :vcr do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit user_movie_path(user_id: user.id, id: movie.movie_id)

    within '#castMembers' do
      expect(page).to have_content('Edward Norton')
      expect(page).to have_content('Brad Pitt')
      expect(page).to have_content('Helena Bonham Carter')
      expect(page).to have_content('Meat Loaf')
      expect(page).to have_content('Jared Leto')
      expect(page).to have_content('Zach Grenier')
      expect(page).to have_content('Holt McCallany')
      expect(page).to have_content('Eion Bailey')
      expect(page).to have_content('Richmond Arquette')
      expect(page).to have_content('David Andrews')
      expect(page).to_not have_content('Christina Cabot')
      expect(page).to_not have_content('Tim DeZarn')
    end
  end

  it 'displays the review count', :vcr do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit user_movie_path(user_id: user.id, id: movie.movie_id)

    expect(page).to have_content('Total Reviews: 7')
  end

  it "displays the review author's name and review content", :vcr do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)
    review = MoviesFacade.movie_reviews(550)
    visit user_movie_path(user_id: user.id, id: movie.movie_id)

    within '#reviews' do
      expect(page).to have_content('Goddard')
      expect(page).to have_content('Brett Pascoe')
      expect(page).to have_content('MSB')
      expect(page).to have_content('r96sk')
      expect(page).to have_content('rsanek')
      expect(page).to have_content('Wuchak')
      expect(page).to have_content('katch22')
    end
  end
end
