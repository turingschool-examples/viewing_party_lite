require 'rails_helper'

RSpec.describe MoviesFacade do
  describe 'methods for facade' do
    it 'returns cast', :vcr do
      cast = MoviesFacade.movie_cast(238)

      expect(cast.first).to be_an(Actor)
      expect(cast).to be_all(Actor)
    end

    it 'returns reviews', :vcr do
      reviews = MoviesFacade.movie_reviews(238)

      expect(reviews).to be_all(Review)
      expect(reviews).to be_an(Array)
    end

    it 'returns movie details', :vcr do
      movie = MoviesFacade.movie_id_search(238)

      expect(movie).to be_a(Movie)
    end
  end
end
