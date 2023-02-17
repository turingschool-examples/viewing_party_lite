require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  describe '#top_rated' do
    it 'returns top 40 info' do
      movies = MovieFacade.top_rated
      expect(movies.count).to eq 40
      expect(movies).to be_an Array

      movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end
  end

  describe '#search' do
    it 'returns movie search info' do
      movies = MovieFacade.search('wayne')
      expect(movies.count).to eq 40
      expect(movies).to be_an Array

      movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end
  end

  describe '#movie_details' do
    it 'returns movie details' do
      movie = MovieFacade.movie_details(278)
      expect(movie).to be_a(MovieDetails)
    end
  end
end
