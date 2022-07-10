require 'rails_helper'

RSpec.describe MovieFacade do
  describe '::get_movies' do
    it 'maps a response from the MovieService' do
      movies = MovieFacade.create_top_movies

      expect(movies).to be_an Array
      expect(movies).to be_all Movie
    end
  end

  describe '::top_rated' do
    it 'returns the top 50 movies with the highest vote average' do
      top_movies = MovieFacade.create_top_movies

      expect(top_movies).to be_an Array
      expect(top_movies).to be_all Movie
    end
  end
  
end
