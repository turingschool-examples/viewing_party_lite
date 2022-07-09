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
end