require 'rails_helper'

RSpec.describe MovieService do
  describe 'api endpoint' do
    it 'can get_movie_data', :vcr do
      movie_data = MovieService.get_movie_data(8)

      expect(movie_data).to be_a(Hash)
      expect(movie_data).to have_key :title
      expect(movie_data[:title]).to be_a(String)
      expect(movie_data).to have_key :poster_path
      expect(movie_data[:poster_path]).to be_a(String)
      expect(movie_data).to have_key :vote_average
      expect(movie_data[:vote_average]).to be_a(Float)
      expect(movie_data).to have_key :runtime
      expect(movie_data[:runtime]).to be_a(Integer)
      expect(movie_data).to have_key :genres
      expect(movie_data[:genres]).to be_an(Array)
      expect(movie_data[:genres][0]).to have_key :name
      expect(movie_data[:genres][0][:name]).to be_an(String)
      expect(movie_data).to have_key :overview
      expect(movie_data[:overview]).to be_an(String)
    end

    it 'can get_top_rated movies', :vcr do
      parsed = MovieService.get_top_rated
      data = parsed[:results].first

      expect(parsed).to be_a(Hash)
      expect(parsed[:results]).to be_a(Array)
      expect(data).to have_key :title
      expect(data[:title]).to be_a(String)
      expect(data).to have_key :vote_average
      expect(data[:vote_average]).to be_a(Float)
    end

    it 'can retrieve movies_search with keyword', :vcr do
      parsed = MovieService.get_movies_search('Miss Congeniality')
      data = parsed[:results].first

      expect(parsed).to be_a(Hash)
      expect(parsed[:results]).to be_a(Array)
      expect(data).to have_key :title
      expect(data[:title]).to be_a(String)
      expect(data).to have_key :vote_average
      expect(data[:vote_average]).to be_a(Float)
    end

    it 'can get_cast_data', :vcr do
      cast_data = MovieService.get_cast_data(3)

      expect(cast_data).to be_a(Hash)
      expect(cast_data).to have_key :cast
      expect(cast_data[:cast]).to be_a(Array)
      expect(cast_data[:cast][0]).to be_a(Hash)
      expect(cast_data[:cast][0]).to have_key :name
      expect(cast_data[:cast][0][:name]).to be_a(String)
      expect(cast_data[:cast][0]).to have_key :character
      expect(cast_data[:cast][0][:character]).to be_a(String)
      expect(cast_data[:cast][0]).to have_key :cast_id
      expect(cast_data[:cast][0][:cast_id]).to be_a(Integer)
    end

    it 'can get_review_data', :vcr do
      review_data = MovieService.get_review_data(3)

      expect(review_data).to be_a(Hash)
      expect(review_data).to have_key :results
      expect(review_data[:results]).to be_a(Array)
      expect(review_data[:results][0]).to have_key :author
      expect(review_data[:results][0][:author]).to be_a(String)
      expect(review_data[:results][0]).to have_key :content
      expect(review_data[:results][0][:content]).to be_a(String)
      expect(review_data).to have_key :total_pages
      expect(review_data[:total_pages]).to be_a(Integer)
    end
  end
end
