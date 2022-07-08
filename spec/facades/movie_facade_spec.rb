# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'returns the top 40 movies', :vcr do
        top_movies = MovieFacade.top_rated_movies

        expect(top_movies.length).to eq(40)
        expect(top_movies).to be_all(Movie)
      end
    end

    describe '#search' do
      it 'returns a max of 40 movies that include the keyword in the title', :vcr do
        search_results = MovieFacade.search('cat')

        expect(search_results.length).to eq(40)
        expect(search_results).to be_all(Movie)

        search_results2 = MovieFacade.search('shawshank')

        expect(search_results2.length).to eq(3)
        expect(search_results2).to be_all(Movie)
      end
    end

    describe '#movie_details' do
      it 'returns the details, reviews, and cast of a movie', :vcr do
        movie = MovieFacade.movie_details(120)

        expect(movie).to be_a(Movie)
        expect(movie.title).to be_a(String)
        expect(movie.reviews).to be_a(Array)
        expect(movie.reviews.length).to be_a(Integer)
        expect(movie.cast).to be_a(Array)
      end
    end
  end
end
