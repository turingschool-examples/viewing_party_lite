require 'rails_helper'

RSpec.describe MovieService do
  describe "top rated movies endpoint" do
    it "gets the top rated movies from this endpoint", :vcr do
      query = "top%20rated"
      parsed_json = MovieService.movie_query_results(query)

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:results]).to be_a Array

      top_movie = parsed_json[:results].first

      expect(top_movie).to include :title, :overview, :original_title, :vote_count #etc.
      expect(top_movie[:title]).to be_a String
      expect(top_movie[:overview]).to be_a String
      expect(top_movie[:original_title]).to be_a String
      expect(top_movie[:vote_count]).to be_a Integer
    end

    it "gets a searched movie via the search endpoint", :vcr do
      query = "search/movie?query=Shaw"
      parsed_json = MovieService.movie_query_results(query)

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:results]).to be_a Array
    end
  end

  describe "single movie endpoints" do
    it "gets a movie endpoint from ID", :vcr do
      shawshank_json = MovieService.get_movie_from_id(278)
      
      expect(shawshank_json).to be_a Hash
      expect(shawshank_json).to have_key(:original_title)
    end

    it "gets a movie's credits endpoint from ID", :vcr do
      shawshank_json = MovieService.get_movie_credits_from_id(278)

      expect(shawshank_json).to be_a Hash
      expect(shawshank_json).to have_key(:cast)
      expect(shawshank_json[:cast].length).to eq 61
    end

    it "gets a movie's images endpoint from ID", :vcr do
      shawshank_json = MovieService.get_movie_images_from_id(278)

      expect(shawshank_json).to be_a Hash
      expect(shawshank_json).to have_key(:backdrops)
    end

    it "gets a movie's reviews endpoint from ID", :vcr do
      shawshank_json = MovieService.get_movie_reviews_from_id(278)

      expect(shawshank_json).to be_a Hash
      expect(shawshank_json[:results]).to be_a Array
      expect(shawshank_json[:results].length).to eq 7
    end
  end
end
