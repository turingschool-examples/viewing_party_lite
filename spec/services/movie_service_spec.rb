# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'returns data for the top 20 movies', :vcr do
        movies = MovieService.top_rated_movies(1)

        expect(movies[:results]).to be_an(Array)
        expect(movies[:results].length).to eq(20)
        first_movie = movies[:results].first

        expect(first_movie[:title]).to be_a(String)
        expect(first_movie[:vote_average]).to be_a(Float)
      end
    end


    describe '#search' do
      it 'returns movies that include the keyword searched in their titles', :vcr do
        movies = MovieService.search('titanic', 1)

        expect(movies[:results]).to be_an(Array)

        movies[:results].each do |movie|
          expect(movie[:title]).to include('Titanic')
          expect(movie[:title]).to be_a(String)
        end
      end
    end
    
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
