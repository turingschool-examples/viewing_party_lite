require 'rails_helper'

RSpec.describe MoviesService do
  describe 'top rated' do
    it 'returns an HTTP response of top rated movies' do
    
      VCR.use_cassette('top_rated_movies') do
        response = MoviesService.top_rated

        expect(response.class).to eq(Hash)
        expect(response[:results].count).to eq(20)
      end
    end
  end
end