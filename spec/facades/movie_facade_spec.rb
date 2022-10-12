# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe '.create_top_20_movies', :vcr do
    it 'retrieves data for top rated movies' do
      movies = MovieFacade.create_top_20_movies

      expect(movies[0]).to be_a Movies
      expect(movies.count).to eq(20)
      expect(movies[1].title).to eq('The Shawshank Redemption')
    end
  end
  describe '.movie_search', :vcr do
    it 'retrieves movies based on user search' do
    movies = MovieFacade.movie_search("Impossible Things")

    expect(movies[0]).to be_a Movies 
    expect(movies.count).to eq(2)
    expect(movies[1].title).to eq("Impossible Things")
    end
  end
  describe '.create_individual_movie', :vcr do
    it 'retrieves single movie' do
    movie = MovieFacade.create_individual_movie(123)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Lord of the Rings")
    expect(movie.vote_average).to eq(6.57)
    expect(movie.overview).to eq("The Fellowship of the Ring embark on a journey to destroy the One Ring and end Sauron's reign over Middle-earth.")
    expect(movie.runtime).to eq(132)
    expect(movie.genres).to eq(["Adventure", "Animation", "Fantasy"])
    end
  end
  describe '.create_cast', :vcr do
    it 'retrieves single movie' do
    cast = MovieFacade.create_cast(123)

    expect(cast).to be_an Array
    expect(cast.first).to eq("Christopher Guard - Frodo (voice)")
    end
  end
  describe '.create_reviews', :vcr do
    it 'retrieves single movie' do
    reviews = MovieFacade.create_reviews(12)

    expect(reviews).to be_an Array
    expect(reviews.first).to be_a String
    end
  end
end
