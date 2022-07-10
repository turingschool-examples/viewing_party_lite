# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieService' do
  describe 'MovieService.conn' do
    it 'establishes the connection to the API service' do
      new_connection = MovieService.conn

      expect(new_connection).to be_a Faraday::Connection
    end
  end

  describe 'MovieService.top_movies' do
    it 'retrieves data and parses response', :vcr do
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

  describe 'MovieService.movie_search(keyword)', :vcr do
    it 'retrieves data and parses response' do
      json_array = MovieService.movie_search('dracula')

      expect(json_array).to be_a Array
      expect(json_array.first).to be_a Hash
      expect(json_array.first[:results]).to be_a Array
      movie = json_array.first[:results].first

      expect(movie).to include :title, :vote_average
    end
  end

  describe 'MovieService.movie_lookup(id)', :vcr do
    it 'retrieves data and parses response' do
      json = MovieService.movie_lookup(11868)

      expect(json).to be_a(Hash)
      expect(json).to include :title, :runtime, :poster_path, :overview, :genres
    end
  end

  describe 'MovieService.cast_lookup(id)', :vcr do
    it 'retrieves data and parses response' do
      json = MovieService.cast_lookup(11868)
      cast = json[:cast]

      expect(cast).to be_a(Array)
      cast.each do |member|
        expect(member).to include :name, :character
      end
    end
  end

  describe 'MovieService.review_lookup(id)', :vcr do
    it 'retrieves data and parses response' do
      json = MovieService.review_lookup(11868)
      reviews = json[:results]

      expect(reviews).to be_a(Array)
      reviews.each do |r|
        expect(r).to include :author, :content
      end
    end
  end


end
