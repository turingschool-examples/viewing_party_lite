require 'rails_helper'

RSpec.describe MovieService do
  describe 'top_movies endpoint' do
    it 'gets top_movies JSON and parses into hash', :vcr do
      response = MovieService.top_rated


      expect(response).to be_a Hash
      expect(response[:results]).to be_a Array
      expect(response[:results].count).to eq 20

      first_movie = response[:results][0]

      expect(first_movie).to have_key :title
      expect(first_movie).to have_key :overview
      expect(first_movie).to have_key :vote_average
    end
  end

  describe 'search endpoint' do
    it 'can search for a movie JSON and parse into hash', :vcr do
      response = MovieService.search_movie_by_name("the shawshank redemption")
      expect(response).to be_a Hash
      expect(response[:results]).to be_a Array
      expect(response[:results].count).to eq 2

      first_movie = response[:results][0]

      expect(first_movie).to have_key :title
      expect(first_movie).to have_key :overview
      expect(first_movie).to have_key :vote_average
    end
  end

  describe 'movie details endpoint' do
    it 'can get movie info JSON and parse into hash', :vcr do
      response = MovieService.get_movie_info(278)
      expect(response).to be_a Hash
      expect(response[:poster_path]).to be_a String

      expect(response).to have_key :poster_path
      expect(response).to have_key :runtime
    end
  end
end
