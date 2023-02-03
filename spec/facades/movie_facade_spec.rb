require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#movie' do
    it 'returns a specific movie object' do
      movie_facade = MovieFacade.new(14)
      expect(movie_facade.movie).to be_a Movie
      expect(movie_facade.movie.id).to eq 14
    end
  end

  describe '#get_top_movies' do
    xit 'returns an array of the top 20 movie objects' do

    end
  end

  describe '#seach_movies()' do
    xit 'returns an array of movie objects based on a search' do

    end
  end
end

