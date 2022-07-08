require 'rails_helper'

RSpec.describe "MovieService" do
  describe "MovieService#conn" do
    it "establishes the connection to the API service" do
      new_connection = MovieService.conn

      expect(new_connection).to be_a Faraday::Connection
    end
  end

  describe "MovieService#top_movies" do
    it "retrieves data and parses response", :vcr do
      json_array = MovieService.top_movies

      expect(json_array).to be_a Array
      expect(json_array.first).to be_a Hash
      expect(json_array.first[:results]).to be_a Array
      movie = json_array.first[:results].first

      expect(movie).to include :original_title, :vote_average
      expect(movie[:original_title]).to be_a String
      expect(movie[:vote_average]).to be_a Float
    end
  end
end
