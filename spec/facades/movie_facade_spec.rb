require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#top_rated', :vcr do
    it 'returns top 40 info' do
      movies = MovieFacade.top_rated
      expect(movies.count).to eq 40
      expect(movies).to be_an Array

      movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end
  end

  describe '#search', :vcr do
    it 'returns movie search info' do
      movies = MovieFacade.search('wayne')
      expect(movies.count).to eq 40
      expect(movies).to be_an Array

      movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end
  end

  describe '#details', :vcr do
    it 'returns movie details' do
      movie = MovieFacade.details(278)
      expect(movie).to be_a(Movie)
    end
  end
end