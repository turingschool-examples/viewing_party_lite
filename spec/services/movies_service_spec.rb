require 'rails_helper'

RSpec.describe MoviesService do
  describe 'methods' do
    it 'returns the top rated movies' do
      top_rated = MoviesService.top_rated_movies

      expect(top_rated).to have_key(:results)
      expect(top_rated[:results]).to be_a(Array)

      expect(top_rated[:results].first).to have_key(:original_title)
      expect(top_rated[:results].first[:original_title]).to be_a(String)

      expect(top_rated[:results].first).to have_key(:vote_average)
      expect(top_rated[:results].first[:vote_average]).to be_a(Float)
    end

    it 'returns movies with keyword' do
      movies = MoviesService.get_movies_keyword('Ring')

      expect(movies.first).to have_key(:results)
      expect(movies.first[:results]).to be_a(Array)
    end

    it 'returns movie cast' do
      movie_cast = MoviesService.get_movie_cast(278)

      expect(movie_cast).to have_key(:cast)
      expect(movie_cast[:cast]).to be_a(Array)
    end

    it 'returns movie details' do
      movie_details = MoviesService.get_movie_details(278)

      expect(movie_details).to have_key(:genres)
      expect(movie_details).to have_key(:runtime)
      expect(movie_details).to be_a(Hash)
    end

    it 'returns movies reviews' do
      movie_reviews = MoviesService.get_movie_reviews(278)

      expect(movie_reviews).to have_key(:results)
      expect(movie_reviews[:results]).to be_a(Array)
    end
  end
end
