require 'rails_helper'
RSpec.describe 'Movie API Services' do
  describe 'Top Rated Movies Endpoint' do
    it 'top rated movies', :vcr do
      response = MoviesService.top_rated

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_a(Array)
      expect(response[:results].count).to eq(20)
    end
  end

  describe 'Searched Movies Endpoint' do
    it 'searched movies', :vcr do
      response = MoviesService.search_by_title('falcon')
      expect(response).to be_a(Hash)

      expect(response[:results]).to be_an Array
      movie_data = response[:results].first

      expect(movie_data).to have_key :title
      expect(movie_data[:title]).to be_a(String)

      expect(movie_data).to have_key :vote_average
      expect(movie_data[:vote_average]).to be_a(Float)
    end
  end

  describe 'Movie Details Endpoint' do
    it 'gets the movie details', :vcr do
      movie_data = MoviesService.movie_details(238)
      expect(movie_data).to be_a(Hash)

      expect(movie_data).to have_key :title
      expect(movie_data[:title]).to be_a(String)

      expect(movie_data).to have_key :id
      expect(movie_data[:id]).to be_a(Integer)

      expect(movie_data).to have_key :vote_average
      expect(movie_data[:vote_average]).to be_a(Float)

      expect(movie_data).to have_key :runtime
      expect(movie_data[:runtime]).to be_a(Integer)

      expect(movie_data).to have_key :overview
      expect(movie_data[:overview]).to be_a(String)
    end
  end

  describe 'Movie Credits Endpoint' do
    it 'gets the movie credits', :vcr do
      movie_credits = MoviesService.movie_credits(238)
      expect(movie_credits).to be_an(Hash)

      cast_member = movie_credits[:cast].first

      expect(cast_member).to have_key :name
      expect(cast_member[:name]).to be_a(String)

      expect(cast_member).to have_key :character
      expect(cast_member[:character]).to be_a(String)
    end
  end

  describe 'Movie Reviews Endpoint' do
    it 'gets the movie reviews', :vcr do
      movie_reviews = MoviesService.movie_reviews(238)
      expect(movie_reviews).to be_an(Hash)

      review = movie_reviews[:results].first

      expect(review).to have_key :author
      expect(review[:author]).to be_a(String)

      expect(review).to have_key :content
      expect(review[:content]).to be_a(String)
    end
  end
end
