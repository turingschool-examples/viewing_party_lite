require 'rails_helper'

describe MovieDbService, :vcr do
  context 'class methods' do
    it 'returns top rated movie data' do
      top_movies = MovieDbService.top_rated_movies_data
      expect(top_movies).to be_a Hash
      expect(top_movies[:results]).to be_an Array
      movie_data = top_movies[:results].first

      expect(movie_data[:id]).to be_a(Integer)
      expect(movie_data[:title]).to be_a(String)
      expect(movie_data[:vote_average]).to be_a(Float)
    end

    it 'returns searched movie data' do
      search_data = MovieDbService.movies_search_data('Godfather')
      expect(search_data).to be_a Hash
      expect(search_data[:results]).to be_an Array
      movie_data = search_data[:results].first

      expect(movie_data[:id]).to be_a(Integer)
      expect(movie_data[:title]).to be_a(String)
      expect(movie_data[:vote_average]).to be_a(Float)
    end

    it 'returns movie by id data' do
      id_movie_data = MovieDbService.find_movie_by_id_data(238)
      expect(id_movie_data).to be_a Hash

      expect(id_movie_data[:id]).to be_a(Integer)
      expect(id_movie_data[:title]).to be_a(String)
      expect(id_movie_data[:vote_average]).to be_a(Float)
    end

    it 'returns movie reviews' do
      reviews = MovieDbService.find_movie_reviews_data('238')
      expect(reviews).to be_a Hash
      # binding.pry
      expect(reviews[:results]).to be_an Array
      review_data = reviews[:results].first

      expect(review_data[:author]).to be_a(String)
      expect(review_data[:content]).to be_a(String)
    end

    it 'returns cast data' do
      cast_data = MovieDbService.cast_data('238')
      expect(cast_data).to be_a Hash
      # binding.pry
      expect(cast_data[:cast]).to be_an Array
      cast_member = cast_data[:cast].first

      expect(cast_member[:name]).to be_a(String)
      expect(cast_member[:character]).to be_a(String)
    end
  end
end
