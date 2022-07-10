require 'rails_helper'

RSpec.describe 'MovieFacade' do

  it 'makes services call and returns an array of movie objects', :vcr do
    movies = MovieFacade.new.return_top_40_movies

    expect(movies).to be_a Array
    expect(movies).to be_all Movie
  end

  it 'can create a new movie object from an api search', :vcr do
    movie = MovieFacade.new.movie_search(278)

    expect(movie).to be_a Movie
    expect(movie.id).to be_a Integer
    expect(movie.title).to be_a String
    expect(movie.vote_average).to be_a Float
  end

  it "makes services call and returns movie objects", :vcr do
    query = "shawshank"
    movies = MovieFacade.new.search_movie(query)

    expect(movies).to be_a Array
    expect(movies).to be_all Movie
  end

  it "makes a service call and returns an array of movie detail objects", :vcr do
    movies = MovieFacade.new.movie_details(278)

    expect(movies).to be_a MovieDetails
    expect(movies.id).to be_a Integer
    expect(movies.title).to be_a String
    expect(movies.vote_average).to be_a Float
    expect(movies.genre).to be_a Array
    expect(movies.genre).to be_all String
    expect(movies.runtime).to be_a Integer
    expect(movies.summary).to be_a String
    expect(movies.cast_members).to be_a Array
    expect(movies.total_reviews).to be_a Integer
    expect(movies.author).to be_a Array
  end
end
