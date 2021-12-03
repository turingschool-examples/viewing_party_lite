require 'rails_helper'
###As of writing this test, the facade is doing the work for both facade and service
RSpec.describe 'Movie Facade' do
  it '.popular_movies', :vcr do
    movies = MovieFacade.popular_movies

    expect(movies).to be_a(Array)
    expect(movies.length).to eq(40)
  end

  it '.movie_details', :vcr do
    movie = MovieFacade.movie_details(238)

    expect(movie).to be_a(DetailedMovie)
    expect(movie.title).to eq('The Godfather')
  end

  it '.cast', :vcr do
    cast = MovieFacade.cast(238)

    expect(cast).to be_a(Array)
    expect(cast.first.name).to eq("Marlon Brando")
  end

  it '.reviews', :vcr do
    reviews = MovieFacade.reviews(238)

    expect(reviews).to be_a(Array)
    expect(reviews.first.author).to eq("futuretv")
  end
end
