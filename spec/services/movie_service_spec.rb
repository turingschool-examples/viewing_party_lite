require 'rails_helper'
require 'faraday'
require 'json'
require './app/services/movie_service'

RSpec.describe MovieService do
  describe 'class methods' do
    describe '.get_movie_data' do
      it 'get the movie data for a specific movie' do
        VCR.use_cassette('fight_club_movie_data_v1') do
          movie_id = 550 #fight club
          response = MovieService.get_movie_data(movie_id)

          expect(response).to be_a(Hash)
          expect(response[:title]).to be_a(String)
          expect(response[:runtime]).to be_a(Integer)
          expect(response[:vote_average]).to be_a(Float)
          expect(response[:images][:posters]).to be_an(Array)
          expect(response[:reviews][:results]).to be_an(Array)
        end
      end
    end

    describe '.conn' do
      it 'is the api' do
        VCR.use_cassette('themoviedb') do
          conn = MovieService.conn

          expect(conn).to be_a Faraday::Connection
        end
      end
    end

    describe '.get_rated_movies_asc(page_number)' do
      it 'returns a api call' do
        VCR.use_cassette('.get_rated_movies_asc(page_number)') do
          rated_movies = MovieService.get_rated_movies_asc(1)
          expect(rated_movies).to be_a Hash
          expect(rated_movies[:results].length).to eq 20
        end
      end
    end

    describe '.search(search_params)' do
      it 'returns a api call' do
        VCR.use_cassette('.search(search_params)') do
          movies = MovieService.search("fight club", 1)

          expect(movies).to be_a Hash
          expect(movies[:results]).to be_a Array
        end
      end
    end

  end
end