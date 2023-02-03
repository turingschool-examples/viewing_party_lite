require 'rails_helper'

RSpec.describe MovieService do 
  describe 'get_top_movies' do 
    it 'should return a response with 20 top movies' do
      service = MovieService.new
      response = service.get_top_movies 

      expect(response).to have_key(:results)
      expect(response[:results]).to be_a Array
      expect(response[:results].length).to eq 20
      expect(response[:results][0]).to have_key :id
      expect(response[:results][0][:id]).to be_a Numeric
      expect(response[:results][0]).to have_key :title
      expect(response[:results][0][:title]).to be_a String
      expect(response[:results][0]).to have_key :vote_average
      expect(response[:results][0][:vote_average]).to be_a Numeric
      expect(response[:results][0]).to have_key :overview
      expect(response[:results][0][:overview]).to be_a String
    end
  end

  describe '#search_movies' do
    it 'returns a response with movie data based on a search' do
      service = MovieService.new
      response = service.search_movies('river') 

      expect(response).to have_key(:results)
      expect(response[:results]).to be_a Array
      expect(response[:results].length).to be <= 20
      expect(response[:results][0]).to have_key :id
      expect(response[:results][0][:id]).to be_a Numeric
      expect(response[:results][0]).to have_key :title
      expect(response[:results][0][:title]).to be_a String
      expect(response[:results][0]).to have_key :vote_average
      expect(response[:results][0][:vote_average]).to be_a Numeric
      expect(response[:results][0]).to have_key :overview
      expect(response[:results][0][:overview]).to be_a String
    end
  end

  describe '#movie' do
    it 'returns the data for a singular movie, with cast and reviews' do
      service = MovieService.new(14)
      response = service.movie

      expect(response).to have_key(:results)
      expect(response).to have_key :id
      expect(response[:id]).to be_a Numeric
      expect(response).to have_key :title
      expect(response[:title]).to be_a String
      expect(response).to have_key :runtime
      expect(response[:runtime]).to be_a Numeric
      expect(response).to have_key :vote_average
      expect(response[:vote_average]).to be_a Numeric
      expect(response).to have_key :genres
      expect(response[:genres]).to be_a Array
      expect(response).to have_key :overview
      expect(response[:overview]).to be_a String
    end
  end
end


