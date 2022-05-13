require 'rails_helper'

RSpec.describe 'MovieFacade' do
  it 'can return an array of movie objects', :vcr do
    movie_list = MovieFacade.movie_list('top_rated')
    one_movie = MovieFacade.movie_list('castaway')

    expect(movie_list).to be_a(Array)
    expect(movie_list).to be_all(Movie)
    expect(one_movie).to be_a(Array)
    expect(one_movie.length).to eq(20)
  end

  it 'can return a single movie object', :vcr do
    single_movie = MovieFacade.single_movie(278)

    expect(single_movie.id).to eq(278)
    expect(single_movie).to be_a(Movie)
  end

  it 'can return a single movies object credits', :vcr do
    single_movie_credits = MovieFacade.single_movie_credits(278)

    expect(single_movie_credits).to be_a(Movie)
  end

  it 'can return an array of a single movies object reviews', :vcr do
    single_movie_reviews = MovieFacade.single_movie_reviews(278)

    expect(single_movie_reviews).to be_a(Array)
  end
end