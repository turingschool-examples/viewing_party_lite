# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieFacade' do
  it 'gives me an array of movie objects', :vcr do
    movies = MovieFacade.top_20_movies

    expect(movies).to be_a Array
    expect(movies).to be_all Movie
  end

  it "returns movies based on query", :vcr do
    movies = MovieFacade.movie_by_keyword("Django")

    expect(movies).to be_a Array
    expect(movies).to be_all Movie

    expect(movies.first.title).to eq("Django Unchained")
    expect(movies.length).to eq(40)
  end

  it "can retrieve from movie details page", :vcr do
    movie = MovieFacade.movie_details(550)

    expect(movie).to be_a Movie

    expect(movie.title).to eq("Fight Club")
    expect(movie.runtime).to eq(139)
  end
end
