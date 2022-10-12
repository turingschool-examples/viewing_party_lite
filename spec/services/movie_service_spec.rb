require 'rails_helper'

RSpec.describe MovieService do
  describe '#top_forty' do
    it 'gets first 40 top rated movies', :vcr do
      movies = MovieService.top_forty

      expect(movies).to be_an Array
      expect(movies.count).to eq 40

      movies.each do |movie|
        expect(movie).to have_key(:id)
        expect(movie[:id]). to be_an Integer
        expect(movie).to have_key(:title)
        expect(movie[:title]).to be_a String
        expect(movie).to have_key(:vote_average)
        expect(movie[:vote_average]).to be_a Float
      end
    end
  end

  describe '#movie_search' do
    it 'returns movies from search', :vcr do
      movies = MovieService.movie_search('Wayne')

      expect(movies).to be_an Array
      expect(movies.count).to eq 40

      movies.each do |movie|
        expect(movie).to have_key(:id)
        expect(movie[:id]). to be_an Integer
        expect(movie).to have_key(:title)
        expect(movie[:title].downcase).to include('wayne')
      end
    end
  end
end
