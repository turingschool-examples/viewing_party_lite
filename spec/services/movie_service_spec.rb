require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'returns data for the top 20 movies' do
        movies = MovieService.top_rated_movies(1)

        expect(movies[:results]).to be_an(Array)
        expect(movies[:results].length).to eq(20)
        first_movie = movies[:results].first
        
        expect(first_movie[:title]).to be_a(String)
        expect(first_movie[:vote_average]).to be_a(Float)
      end
    end
    
    describe '#find_movie' do
      it 'returns details for a movie with the given id', :vcr do
        movie = MovieService.find_movie(120)

        expect(movie[:title]).to be_a(String)
        expect(movie[:vote_average]).to be_a(Float)
        expect(movie[:runtime]).to be_a(Integer)
        expect(movie[:genres]).to be_a(Array)
        expect(movie[:overview]).to be_a(String)
      end
    end

    describe '#movie_cast' do
      it 'returns the case for a movie with the given id', :vcr do
        movie_cast = MovieService.movie_cast(120)
        cast = movie_cast[:cast]

        expect(cast).to be_a(Array)
        expect(cast).to be_all(Hash)

        actor = cast[0]
        expect(actor[:character]).to be_a(String)
        expect(actor[:name]).to be_a(String)
      end
    end
  end
end