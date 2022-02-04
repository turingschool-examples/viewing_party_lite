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

    context '.search_for_movie' do
      it "returns movie search" do
        search = MovieService.search_for_movie('Dune')
        expect(search).to be_a Hash
        expect(search[:results]).to be_a Array

        search_data = search[:results].first

        expect(search_data).to have_key :title
        expect(search_data[:title]).to be_a String

        expect(search_data).to have_key :id
        expect(search_data[:id]).to be_a Integer

        expect(search_data).to have_key :vote_average
        expect(search_data[:vote_average]).to be_a Float

        expect(search_data).to have_key :poster_path
        expect(search_data[:poster_path]).to be_a String

        expect(search_data).to have_key :overview
        expect(search_data[:overview]).to be_a String
      end
    end

    context '.movie_info' do
      it "returns movie_info" do
        info = MovieService.movie_info(100)
        expect(info).to be_a Hash

        expect(info).to have_key :title
        expect(info[:title]).to be_a String

        expect(info).to have_key :id
        expect(info[:id]).to be_a Integer

        expect(info).to have_key :vote_average
        expect(info[:vote_average]).to be_a Float

        expect(info).to have_key :poster_path
        expect(info[:poster_path]).to be_a String

        expect(info).to have_key :overview
        expect(info[:overview]).to be_a String
      end
    end

    context '.reviews' do
      it "returns reviews" do
        info = MovieService.reviews(100)
        expect(info).to be_a Hash
        expect(info[:results]).to be_a Array

        info_results = info[:results][0]

        expect(info_results).to have_key :author
        expect(info_results[:author]).to be_a String

        expect(info_results).to have_key :content
        expect(info_results[:content]).to be_a String
      end
    end

    context '.cast' do
      it "returns movie cast" do
        cast = MovieService.cast(100)
        expect(cast).to be_a Hash
        expect(cast[:cast]).to be_a Array

        cast_info = cast[:cast].first

        expect(cast_info).to have_key :name
        expect(cast_info[:name]).to be_a String

        expect(cast_info).to have_key :character
        expect(cast_info[:character]).to be_a String
      end
    end
  end
end
