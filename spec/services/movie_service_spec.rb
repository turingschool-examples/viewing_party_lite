require 'rails_helper'
require 'faraday'
require 'json'
require './app/services/movie_service'

RSpec.describe MovieService do
  describe 'class methods' do
    describe 'get_movie_data' do
      it 'get the movie data for a specific movie' do
        VCR.use_cassette('fight_club_movie_data_v1') do
          movie_id = 550 #fight club
          response = MovieService.get_movie_details(movie_id)

          expect(response).to be_a(Hash)
          expect(response[:title]).to be_a(String)
          expect(response[:runtime]).to be_a(Integer)
          expect(response[:vote_average]).to be_a(Float)
          expect(response[:images][:posters]).to be_an(Array)
          expect(response[:reviews][:results]).to be_an(Array)
        end
      end
    end
  end
end