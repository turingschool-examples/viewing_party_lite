require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#movie's data" do
      it "returns data of a particular movie" do
        json_response = File.open("spec/fixtures/shawshank.json")
        stub_request(:get, "https://www.themoviedb.org/3/search/movie?api_key=#{ENV['moviedb_api_key']}&query=The%20Shawshank%20Redemption").to_return(status: 200, body: json_response)

        search = MovieService.search_movies("The Shawshank Redemption")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :original_title
        expect(movie_data[:original_title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end

      it "returns the 20 top rated movies" do
        json_response = File.open("spec/fixtures/top_rated.json")
        stub_request(:get, "https://www.themoviedb.org/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}").to_return(status: 200, body: json_response)

        search = MovieService.top_movies
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        expect(search[:results].count).to eq(20)

        movie_data = search[:results].last

        expect(movie_data).to have_key :original_title
        expect(movie_data[:original_title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data[:original_title]).to eq("Forrest Gump")
      end
    end
  end
end
