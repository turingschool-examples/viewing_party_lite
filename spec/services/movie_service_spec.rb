require 'rails_helper'

RSpec.describe 'MovieService' do
    before :each do
      @movie_service = MovieService.new
    end


  context 'happy path' do
    it 'retrieves data and parses response', :vcr do

      parsed_json = @movie_service.top_40_rated_movies

      expect(parsed_json).to be_a Array
      movie = parsed_json.first

      expect(movie).to include :title, :vote_average
      expect(movie[:title]).to be_a(String)
      expect(movie[:vote_average]).to be_a(Float)
    end


  it 'can consume the movie search api and return a parsed response body', :vcr do
    parsed_json = @movie_service.poro_search(278)

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:id]).to be_a Integer
    expect(parsed_json[:title]).to be_a String
    expect(parsed_json[:vote_average]).to be_a Float
  end

  it "accepts query and parses data for movie search", :vcr do
     parsed_json = @movie_service.movie_search("Shawshank")

     expect(parsed_json). to be_a Hash
     movie = parsed_json[:results].first
     expect(movie).to include :id, :title, :vote_average
     expect(movie[:id]).to be_a(Integer)
     expect(movie[:title]).to be_a(String)
     expect(movie[:vote_average]).to be_a(Float)
    end


  end
end
