require 'rails_helper'

RSpec.describe MoviesService do
  describe 'top rated' do
    it 'returns an HTTP response of top rated movies' do
    
      VCR.use_cassette('top_rated_movies') do
        response = MoviesService.top_rated
        movie = response[:results].first

        expect(response).to be_a(Hash)
        expect(response[:results]).to be_an(Array)
        expect(response[:results].count).to eq(20)
        expect(movie).to have_key(:overview)
        expect(movie[:overview]).to be_a(String)
      end
    end
  end

  describe 'search' do
    it 'returns the http response of a keyword search' do
      keyword = "Minions"
      
      VCR.use_cassette("search_#{keyword}") do
        response = MoviesService.search(keyword)
        movie = response[:results].first

        expect(response).to be_a(Hash)
        expect(movie).to have_key(:title)
        expect(movie[:title]).to be_a(String)
      end
    end
  end

  describe 'details' do
    it 'returns details of a movie given its id' do
      VCR.use_cassette('movie-detailed') do
        movie_details = MoviesService.details(438148)

        expect(movie_details).to be_a(Hash)
        expect(movie_details).to have_key(:vote_average)
        expect(movie_details[:vote_average]).to be_an(Float)
      end
    end
  end
end