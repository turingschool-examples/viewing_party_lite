require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#get_a_movie', :vcr do
    it 'returns a movie' do
      movies = MovieFacade.get_a_movie('batman')
      expect(movies.first.title).to eq('The Batman')
      expect(movies).to be_an(Array)
    end

    it 'returns a maximum of 40 movies', :vcr do
      movies = MovieFacade.get_a_movie('a')
      expect(movies.count).to eq(40)
    end
  end

  describe '#find_top_40_movies', :vcr do
    it 'returns top 40 movies' do
      movies = MovieFacade.find_top_40_movies
      expect(movies.first.title).to eq('The Shawshank Redemption')
      expect(movies).to be_an(Array)
      expect(movies.first).to be_a(Movie)
    end

    it 'returns only the top 40 movies', :vcr do
      movies = MovieFacade.find_top_40_movies
      expect(movies.count).to eq(40)
      expect(movies.first).to be_a(Movie)
    end
  end

  describe '#find_movie_details', :vcr do
    it 'returns movie details' do
      movie = MovieFacade.find_movie_details(293660)
      expect(movie.title).to eq('Deadpool')
      expect(movie).to be_an(Movie)
    end
  end
end
