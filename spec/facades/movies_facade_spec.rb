require 'rails_helper'

RSpec.describe MoviesFacade do
  describe 'methods' do
    it 'returns a list of movies' do
      movies = MoviesFacade.get_top_rated_movies

      expect(movies).to be_all(Movie)
    end
    it 'returns a list of actors' do
      actors = MoviesFacade.get_cast(278)

      expect(actors).to be_all(Actor)
    end
    it 'returns a list of movie reviews' do
      movie_reviews = MoviesFacade.get_reviews(278)

      expect(movie_reviews).to be_all(MovieReview)
    end
    it 'returns a list of movie details' do
      movie_details = MoviesFacade.get_details(278)

      expect(movie_details).to be_a(MovieDetails)
    end
  end
end
