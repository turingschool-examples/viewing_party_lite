require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#top_rated' do
    it 'returns top rated movies' do
      results = MovieFacade.top_rated_movies
      expect(results.count).to eq(20)
    end

    it '#movies_by_keyword' do
      results = MovieFacade.movies_keyword_query("Fight Club")
    
      expect(results[0].title).to eq("Fight Club")
    end

    it '#get_movie_details' do
      movie_details = MovieFacade.get_movie_details(505)

      expect(movie_details).to be_a(MovieDetails)
    end
  end
end
