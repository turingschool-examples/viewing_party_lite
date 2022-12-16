require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#search" do
      it "returns the searched movie results" do
        search = MovieService.search("jojo")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        searched_movie = search[:results].first

        expect(searched_movie).to have_key :title
        expect(searched_movie[:title]).to be_a(String)

        expect(searched_movie).to have_key :vote_average
        expect(searched_movie[:vote_average]).to be_a(Float)
      end
    end

    context "#top_rated" do
      it "returns the top rated movies" do
        top_movies = MovieService.top_rated
        expect(top_movies).to be_a Hash
        expect(top_movies[:results]).to be_an Array
        no1_movie = top_movies[:results].first

        expect(no1_movie).to have_key :title
        expect(no1_movie[:title]).to be_a(String)

        expect(no1_movie).to have_key :vote_average
        expect(no1_movie[:vote_average]).to be_a(Float)
      end
    end

    context "#movie_by_id" do
    it "returns the top rated movies" do
      movie = MovieService.movie_by_id(515001)
      expect(movie).to be_a Hash

      expect(movie).to have_key :id
      expect(movie[:id]).to be_a(Integer)

      expect(movie).to have_key :title
      expect(movie[:title]).to be_a(String)

      expect(movie).to have_key :vote_average
      expect(movie[:vote_average]).to be_a(Float)

      expect(movie).to have_key :overview
      expect(movie[:overview]).to be_a(String)

      expect(movie).to have_key :runtime
      expect(movie[:runtime]).to be_a(Integer)
    end
  end
  end
end