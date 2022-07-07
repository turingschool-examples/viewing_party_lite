require 'rails_helper'

RSpec.describe "MovieService" do
  describe "MovieService#conn" do
    it "establishes the connection to the API service" do
      new_connection = MovieService.conn

      expect(new_connection).to be_a Faraday::Connection
    end
  end

  describe "MovieService#top_40" do
    it "retrieves data and parses response", :vcr do
      parsed_json = MovieService.top_movies

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:results]).to be_a Array
      movie = parsed_json[:results].first

      expect(movie).to include :original_title, :vote_average
      expect(movie[:original_title]).to be_a String
      expect(movie[:vote_average]).to be_a Float
    end
  end
end
