require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#get_movies' do
    it 'returns an array of movies', :vcr do
      title = "fight"
      array_of_movies = MovieFacade.get_movies(title)
  
      expect(array_of_movies).to be_a Array
      expect(array_of_movies.first.class).to be(Movie)
      expect(array_of_movies).to all( be_a(Movie) )
      # Are we supposed to be getting 40 results here? Or did we decide on 20?
    end
  end

  describe '#movie_by_id' do
    it 'returns a single movie', :vcr do
      movie = MovieFacade.movie_by_id(550)
      expect(movie).to be_a Movie
      expect(movie.title).to eq("Fight Club")
      expect(movie.id).to eq(550)
    end
  end
end