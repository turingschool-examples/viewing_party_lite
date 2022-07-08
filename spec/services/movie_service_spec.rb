# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'returns data for the top 20 movies' do
        movies = MovieService.top_rated_movies(1)

        expect(movies[:results]).to be_an(Array)
        expect(movies[:results].length).to eq(20)
        first_movie = movies[:results].first

        expect(first_movie[:title]).to be_a(String)
        expect(first_movie[:vote_average]).to be_a(Float)
      end
    end

    # describe '#find_movie' do
    #   it 'returns details for a movie with the given id', :vcr do
    #     movie = MovieService.find_movie(120)

    #     expect(movie[:title]).to be_a(String)
    #     expect(movie[:vote_average]).to be_a(Float)
    #     expect(movie[:runtime]).to be_a(Integer)
    #     expect(movie[:genres]).to be_a(Array)
    #     expect(movie[:overview]).to be_a(String)
    #   end
    # end

    # describe '#movie_cast' do
    #   it 'returns the case for a movie with the given id', :vcr do
    #     movie_cast = MovieService.movie_cast(120)
    #     cast = movie_cast[:cast]

    #     expect(cast).to be_a(Array)
    #     expect(cast).to be_all(Hash)

    #     actor = cast[0]
    #     expect(actor[:character]).to be_a(String)
    #     expect(actor[:name]).to be_a(String)
    #   end
    # end

    # describe '#movie_reviews' do
    #   it 'returns the reviews for the movie', :vcr do
    #     movie_reviews = MovieService.movie_reviews(120)
    #     reviews = movie_reviews[:results]

    #     expect(reviews).to be_a(Array)
    #     expect(reviews).to be_all(Hash)

    #     review = reviews[0]
    #     expect(review[:content]).to be_a(String)
    #     expect(review[:author]).to be_a(String)
    #   end
    # end

    describe '#movie_details' do
      it 'returns movie informaiton, reviews, and credits', :vcr do
        movie_details = MovieService.movie_details(120)
        reviews = movie_details[:reviews][:results]
        cast = movie_details[:credits][:cast]

        expect(movie_details[:title]).to be_a(String)
        expect(movie_details[:vote_average]).to be_a(Float)
        expect(movie_details[:runtime]).to be_a(Integer)
        expect(movie_details[:genres]).to be_a(Array)
        expect(movie_details[:overview]).to be_a(String)

        expect(cast).to be_a(Array)
        expect(cast).to be_all(Hash)

        actor = cast[0]
        expect(actor[:character]).to be_a(String)
        expect(actor[:name]).to be_a(String)

        expect(reviews).to be_a(Array)
        expect(reviews).to be_all(Hash)

        review = reviews[0]
        expect(review[:content]).to be_a(String)
        expect(review[:author]).to be_a(String)
      end
    end
  end
end
