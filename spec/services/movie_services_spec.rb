require 'rails_helper'

RSpec.describe 'Movie API Services' do
  describe 'api consumption test'  do
    it 'top rated movies', :vcr do
      response = MovieService.top_rated

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_a(Array)
      expect(response[:results].count).to eq(20)
    end

    it 'movie details', :vcr do
      response = MovieService.movie_details(550)

      expect(response).to be_a(Hash)
      expect(response[:overview]).to be_a(String)
      expect(response[:id]).to be_a(Integer)
    end

    it 'movie credits', :vcr do
      response = MovieService.movie_credits(550)

      expect(response).to be_a(Hash)
      expect(response[:cast]).to be_a(Array)
      expect(response[:cast].count).to eq(75)
      expect(response[:id]).to be_a(Integer)
      expect(response[:cast][0][:name]).to be_a(String)
      expect(response[:cast][0][:popularity]).to be_a(Float)
    end

    it 'movie reviews', :vcr do
      response = MovieService.movie_reviews(550)
      
      expect(response).to be_a(Hash)
      expect(response[:results]).to be_a(Array)
      expect(response[:results][0][:author]).to be_a(String)
      expect(response[:results][0][:author_details]).to be_a(Hash)
    end
  end
end