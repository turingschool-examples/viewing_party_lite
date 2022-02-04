require 'rails_helper'

RSpec.describe MovieService do
  context 'class methods' do
    context '.top_movies' do
      it "returns top movie data" do
        top_movies = MovieService.top_movies
        expect(top_movies).to be_a Array
        expect(top_movies).to be_a Array

        top_movie_data = top_movies.first

        expect(top_movie_data).to have_key :title
        expect(top_movie_data[:title]).to be_a String

        expect(top_movie_data).to have_key :id
        expect(top_movie_data[:id]).to be_a Integer

        expect(top_movie_data).to have_key :vote_average
        expect(top_movie_data[:vote_average]).to be_a Float

        expect(top_movie_data).to have_key :poster_path
        expect(top_movie_data[:poster_path]).to be_a String

        expect(top_movie_data).to have_key :overview
        expect(top_movie_data[:overview]).to be_a String
      end
    end
  end
end
