require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#get_movies' do
    it 'returns an array of movies', :vcr do
      title = "fight"
      array_of_movies = MovieFacade.get_movies(title)
  
      expect(array_of_movies).to be_a Array
      expect(array_of_movies.first.class).to be(Movie)
      expect(array_of_movies).to all( be_a(Movie) )
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

  describe '#top_10_cast' do
    it 'returns an array of the first 10 billed cast members', :vcr do 
      cast_members = MovieFacade.top_10_cast(550)
      expect(cast_members).to be_an Array
      expect(cast_members).to all(be_a String)
      expect(cast_members.length).to eq(10)
    end
  end

  describe '#get_top20_movies' do
    it 'returns the top 20 movies at the current time', :vcr do 
      movies = MovieFacade.get_top20_movies
      expect(movies).to be_an Array
      expect(movies).to all(be_a Movie)
      expect(movies.length).to eq(20)
    end
  end
end
