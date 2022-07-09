require 'rails_helper'

RSpec.describe MovieFacade do 
  it 'makes services call and returns an array of member objects', :vcr do
    movies = MovieFacade.top_rated_array

    expect(movies).to be_a(Array)
    expect(movies).to be_all(Movie)
  end

  describe 'methods for facade' do
    it 'returns cast', :vcr do
      cast = MovieFacade.movie_cast(238)

      expect(cast.first).to be_an(Actor)
      expect(cast).to be_all(Actor)
    end

    it 'returns reviews', :vcr do
      reviews = MovieFacade.movie_reviews(238)

      expect(reviews).to be_all(Review)
      expect(reviews).to be_an(Array)
    end

    it 'returns movie details', :vcr do
      movie = MovieFacade.movie_id_search(238)

      expect(movie).to be_a(Movie)
    end
  end
end