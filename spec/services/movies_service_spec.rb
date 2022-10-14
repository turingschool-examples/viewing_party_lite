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

  describe 'search' do
    it 'returns the http response of a keyword search' do
      keyword = 'Minions'

      VCR.use_cassette("search_#{keyword}") do
        response = MoviesService.search(keyword)
        expect(response.class).to eq(Hash)
      end
    end
  end

  describe 'details' do
    it 'returns details of a movie given its id' do
      VCR.use_cassette('movie-detailed') do
        response = MoviesService.details(438_148)
        expect(response.class).to eq(Hash)
      end
    end
  end
end
