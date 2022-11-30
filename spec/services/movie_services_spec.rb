require 'rails_helper'

RSpec.describe MoviesService do 
  describe 'class methods' do 
    describe '#top_rated_movies' do 
      it 'returns top rated movies data' do 
        # stub_request(:get, '/3/movie/top_rated')
        #   .to_return(status: 200, body: json_response)
        VCR.use_cassette('top_rated_movies') do 
          movies = MoviesService.top_rated_movies

          expect(movies[:results]).to be_a Array

          first_movie = movies[:results].first

          expect(first_movie[:title]).to be_a String
          expect(first_movie[:vote_average]).to be_a Float 
        end
      end
    end
  end
end