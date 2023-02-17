require 'rails_helper'

RSpec.describe MovieService, :vcr do
  describe '#top_rated_movies' do
    it 'gets first 40 top rated movies' do
      movies = MovieService.top_rated_movies

      expect(movies).to be_an Array
      expect(movies.count).to eq 40

      movies.each do |movie|
        expect(movie).to have_key(:id)
        expect(movie[:id]).to be_an Integer
        expect(movie).to have_key(:title)
        expect(movie[:title]).to be_a String
        expect(movie).to have_key(:vote_average)
        expect(movie[:vote_average]).to be_a Float
      end
    end
  end

  describe '#movie_search' do
    it 'returns movies from search' do
      movies = MovieService.movie_search('Wayne')

      expect(movies).to be_an Array
      expect(movies.count).to eq 40

      movies.each do |movie|
        expect(movie).to have_key(:id)
        expect(movie[:id]).to be_an Integer
        expect(movie).to have_key(:title)
        expect(movie[:title].downcase).to include('wayne')
      end
    end
  end

  describe '#movie_details' do
    it 'returns movies details' do
      movie = MovieService.movie_details(9614)

      expect(movie[:title]).to eq('Happy Gilmore')
      expect(movie[:vote_average]).to be_a Float
      expect(movie[:runtime]).to be_an Integer
      expect(movie[:genres]).to be_an Array
      expect(movie[:overview]).to be_a String
      expect(movie[:credits][:cast]).to be_an Array
      expect(movie[:reviews]).to be_a Hash
    end
  end
end
