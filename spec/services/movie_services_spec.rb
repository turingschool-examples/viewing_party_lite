require 'rails_helper'

RSpec.describe MoviesService do 
  describe 'class methods' do 
    describe '#top_rated_movies' do 
      it 'returns top rated movies data' do 
        VCR.use_cassette('top_rated_movies') do 
          movies = MoviesService.top_rated_movies

          expect(movies[:results]).to be_a Array

          first_movie = movies[:results].first

          expect(first_movie[:title]).to be_a String
          expect(first_movie[:vote_average]).to be_a Float 
        end
      end
    end

    describe '#search' do 
      it 'returns a search of movies based on a title query' do 
        VCR.use_cassette('search_godfather') do 
          movies = MoviesService.search('godfather')

          expect(movies[:results]).to be_a Array

          first_movie = movies[:results].first

          expect(first_movie[:title]).to be_a String
          expect(first_movie[:vote_average]).to be_a Float 
        end
      end
    end

    describe 'credits' do
      it 'returns movie credits json with cast array' do
        VCR.use_cassette('movie_credits') do
          credits = MoviesService.credits(238)

          expect(credits[:cast]).to be_a Array

          first_actor = credits[:cast].first
          expect(first_actor[:name]).to be_a String
          expect(first_actor[:character]).to be_a String
        end
      end
    end

    describe 'reviews' do
      it 'returns movie review json' do
        VCR.use_cassette('movie_reviews') do
          reviews = MoviesService.reviews(238)

          expect(reviews[:results]).to be_a Array
        end
      end
    end

    describe 'details' do
      it 'returns movie details json' do
        VCR.use_cassette('movie_details') do
          details = MoviesService.details(238)

          expect(details[:id]).to be_a Integer
          expect(details[:title]).to be_a String
          expect(details[:vote_average]).to be_a Float
          expect(details[:runtime]).to be_a Integer
          expect(details[:genres]).to be_a Array
        end
      end
    end
  end
end