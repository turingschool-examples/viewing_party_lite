# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService, type: :service do
  describe 'Class Methods', :vcr do
    describe '.get_top_rated' do
      it 'returns top rated movies' do
        top_rated_hash = MovieService.get_top_rated
        expect(top_rated_hash.count).to eq 20
        expect(top_rated_hash[0][:genre_ids]).to be_a Array
        expect(top_rated_hash[0][:id]).to be_a Integer
        expect(top_rated_hash[0][:title]).to be_a String
        expect(top_rated_hash[0][:vote_average]).to be_a Float
        expect(top_rated_hash[0][:overview]).to be_a String
      end
    end
    describe '.get_movie_search' do
      it 'returns searched movies' do
        movie_search_hash = MovieService.get_movie_search('Impossible Things')
        expect(movie_search_hash[0][:genre_ids]).to be_a Array
        expect(movie_search_hash[0][:id]).to be_a Integer
        expect(movie_search_hash[0][:title]).to be_a String
        expect(movie_search_hash[0][:release_date]).to be_a String
        expect(movie_search_hash[0][:vote_average]).to be_a Float
      end
    end
    describe '.get_individual_movie' do
      it 'gets individual movie by ID' do
        individual_movie_hash = MovieService.get_individual_movie(667_257)
        expect(individual_movie_hash[:id]).to be_a Integer
        expect(individual_movie_hash[:genres]).to be_a Array
        expect(individual_movie_hash[:genres][0]).to be_a Hash
        expect(individual_movie_hash[:overview]).to be_a String
        expect(individual_movie_hash[:poster_path]).to be_a String
        expect(individual_movie_hash[:runtime]).to be_a Integer
        expect(individual_movie_hash[:tagline]).to be_a String
        expect(individual_movie_hash[:title]).to be_a String
        expect(individual_movie_hash[:vote_average]).to be_a Float
      end
    end
    describe '.get_cast' do
      it 'gets cast of a certain movie' do
        get_cast_hash = MovieService.get_cast(667_257)
        expect(get_cast_hash).to be_a Hash
        expect(get_cast_hash[:cast]).to be_a Array
        expect(get_cast_hash[:cast][0][:gender]).to be_a Integer
        expect(get_cast_hash[:cast][0][:id]).to be_a Integer
        expect(get_cast_hash[:cast][0][:name]).to be_a String
        expect(get_cast_hash[:cast][0][:popularity]).to be_a Float
        expect(get_cast_hash[:cast][0][:character]).to be_a String
      end
    end
    describe '.get_reviews' do
      it 'gets reviews of a certain movie' do
        reviews_hash = MovieService.get_reviews(667_257)
        expect(reviews_hash).to be_a Hash
        expect(reviews_hash.count).to eq 5
        expect(reviews_hash[:id]).to be_a Integer
        expect(reviews_hash[:page]).to be_a Integer
        expect(reviews_hash[:results]).to be_a Array
        expect(reviews_hash[:total_pages]).to be_a Integer
        expect(reviews_hash[:total_results]).to be_a Integer
      end
    end
  end
end
