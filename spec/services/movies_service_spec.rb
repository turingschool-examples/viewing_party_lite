require 'rails_helper'
RSpec.describe 'Movie API Services' do
  describe 'Top Rated Movies Endpoint'  do
    it 'top rated movies', :vcr do
      response = MoviesService.top_rated


      expect(response).to be_a(Hash)
      expect(response[:results]).to be_a(Array)
      expect(response[:results].count).to eq(20)
    end
  end

  describe 'Searched Movies Endpoint' do
    it 'top rated movies', :vcr do

      response = MoviesService.search_by_title("falcon")
      expect(response).to be_a(Hash)
    end
  end
end
