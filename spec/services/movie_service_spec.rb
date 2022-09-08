# frozen_string_literal: true

require 'rails_helper'

describe MovieService do
  describe 'class methods' do
    it 'search (40 results) service', vcr: 'search_phoenix' do
      search = MovieService.movie_search('phoenix')
      expect(search).to be_a Array
      expect(search.length).to eq(40)

      movie = search.first
      expect(movie).to include :id, :title, :vote_average
      expect(movie[:id]).to be_a(Integer).or be_a(Float)
      expect(movie[:title]).to be_a(String)
    end

    it 'top 40 rated service', vcr: 'top_rated' do
      top_rated = MovieService.top_rated
      expect(top_rated).to be_a Array
      expect(top_rated.length).to eq(40)

      movie = top_rated.first
      expect(movie).to include :id, :title, :vote_average
      expect(movie[:id]).to be_a(Integer).or be_a(Float)
      expect(movie[:title]).to be_a(String)
    end
    it 'movie details service', vcr: 'movie_details' do
      # pass in a movie id. 550 is Fight Club
      movie_details = MovieService.movie_details(550)
      expect(movie_details).to be_a Hash
      expect(movie_details).to include :title, :vote_average, :runtime, :genres, :overview
      expect(movie_details[:title]).to eq('Fight Club')
    end
  end
end
