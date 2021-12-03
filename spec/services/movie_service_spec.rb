require 'rails_helper'

RSpec.describe 'Moive API Service' do
  describe 'happy path' do
    it 'can get most popular movie data', :vcr do
        response = MovieService.popular_movies

        expect(response).to be_a Hash
        expect(response[:results]).to be_a Array

        first_movie_data = response[:results].first

        expect(first_movie_data).to have_key :original_title
        expect(first_movie_data[:original_title]).to be_a String

        expect(first_movie_data).to have_key :vote_average
        expect(first_movie_data[:vote_average]).to be_a Float
    end
  end

    it 'can get movie details', :vcr do
      response = MovieService.get_movie_details_db(512195)

      expect(response[:original_title]).to be_a String
      expect(response[:overview]).to be_a String
    end

    it 'can get a movie cast' do
      VCR.use_cassette('movie_cast', re_record_interval: 30.days) do
        response = MovieService.get_cast_members(512195)

        expect(response[0][:name]).to be_a String
      end
    end
end
