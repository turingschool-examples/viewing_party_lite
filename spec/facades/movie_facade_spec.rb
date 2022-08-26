# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieFacade', :vcr do
  it 'should return an array of top movies' do
    movies = MovieFacade.top_movies

    expect(movies).to be_a Array
    expect(movies).to be_all TopMovie
  end

  it 'should return a specific movie' do
    movie = MovieFacade.movie(238)

    expect(movie).to be_a Movie
  end

  it 'should return an array of movies that you searched for' do
    movie = MovieFacade.search_movies('Phoenix')
    expect(movie).to be_a Array
    expect(movie).to be_all TopMovie
  end
end
