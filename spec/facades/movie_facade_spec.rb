require 'rails_helper'

describe 'Movie Facade' do
  it 'can see the movie details' do
    VCR.use_cassette('fight_club') do
      fight_club = MovieFacade.movie_details(550)
      expect(fight_club).to be_a(Movie)

    end
  end

  it 'can display top 20 movies' do
    VCR.use_cassette('top_rated_movies') do
      top_rated_movies = MovieFacade.top_20_movies
      expect(top_rated_movies).to be_a(Array)
      expect(top_rated_movies.count).to eq(20)
    end
  end

  it 'can display movies by search results' do
    VCR.use_cassette('search_movies') do
      movie_term = "Jack"
      search_movies = MovieFacade.search_results(movie_term)
      expect(search_movies).to be_a(Array)
      # expect(top_rated_movies.count).to eq(20)
    end
  end
end
