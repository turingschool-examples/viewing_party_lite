require 'rails_helper'

describe 'MovieFacade' do
  it 'can find popular movies' do
    VCR.use_cassette('popular_movies', re_record_interval: 30.days) do
        movies = MovieFacade.find_popular_movies

        expect(movies).to be_a Array
        expect(movies.first).to be_a Movie
        expect(movies.count).to eq(20)
    end
  end

  it 'can get movie details' do
    VCR.use_cassette('get_movie_details', re_record_interval: 30.days) do

      movie_result = MovieFacade.get_movie_details(512195)
      expect(movie_result).to be_a Movie
    end 
  end
end
