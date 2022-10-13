require 'rails_helper'

RSpec.describe MoviesTopRated do
  describe 'movies top rated poros', :vcr do
    before :each do
      @movies_top_rated = MovieFacade.top_rated_poro
    end

    it 'instantiates' do
      expect(@movies_top_rated).to be_a(MoviesTopRated)
    end

    it 'results method returns an array of hashes' do
      expect(@movies_top_rated.results).to be_a(Array)
      expect(@movies_top_rated.results[0]).to be_a(Hash)
      expect(@movies_top_rated.results[0][:title]).to be_a(String)
    end

    it 'returns an array of movie titles as strings' do
      top_rated_movies = @movies_top_rated.results.map { |result| result[:title] }

      expect(top_rated_movies).to be_a(Array)
      expect(top_rated_movies[0]).to be_a(String)
    end

    it 'returnns an array of movie ids as integers' do
      top_rated_movies = @movies_top_rated.results.map { |result| result[:id] }

      expect(top_rated_movies).to be_a(Array)
      expect(top_rated_movies[0]).to be_a(Integer)
    end

    it 'has top rated titles method' do
      expect(@movies_top_rated.titles).to be_a(Array)
    end
  end
end