# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'returns the top 40 movies', :vcr do
        top_movies = MovieFacade.top_rated_movies

        expect(top_movies.length).to eq(40)
        expect(top_movies.first).to be_a(Movie)
      end
    end

    describe '#movie_details' do
      it 'returns the details, reviews, and cast of a movie', :vcr do
        movie = MovieFacade.movie_details(120)

        expect(movie).to be_a(Movie)
        expect(movie.title).to be_a(String)
        expect(movie.reviews).to be_a(Hash)
        expect(movie.reviews.length).to be_a(Integer)
        expect(movie.cast).to be_a(Hash)
        expect(movie.cast.length).to be <= 10
      end
    end
  end
end
