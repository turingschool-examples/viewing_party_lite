require 'rails_helper'
RSpec.describe 'Movie API Services' do
  describe 'Top Rated Movies Endpoint'  do
    it 'returns the top rated movies', :vcr do

      # json_response = File.read('spec/fixtures/top_rated_movies.json')

      # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=b0cd8cc18c05fde4dd8fcd1da35ac719").
      #   to_return(status: 200, body: json_response)

      response = MoviesService.top_rated


      expect(response).to be_a(Hash)
      expect(response[:results]).to be_a(Array)
      expect(response[:results].count).to eq(20)
    end
  end
end
