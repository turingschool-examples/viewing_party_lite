# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieService' do
  context 'happy path' do
    it 'returns top 20 movies', :vcr do
      parsed_json = MovieService.top_20_movies

      expect(parsed_json).to be_a Array

      movie = parsed_json.first

      expect(movie).to include :title, :vote_average
      expect(movie[:title]).to be_a(String)
      expect(movie[:vote_average]).to be_a(Float)
    end

    it "searches for movies", :vcr do
      parsed_json = MovieService.movie_by_keyword("Django")
      expect(parsed_json).to be_a Array
      movie = parsed_json.first

      expect(movie).to include :title, :vote_average
      expect(movie[:title]).to be_a(String)
      expect(movie[:vote_average]).to be_a(Float)
      expect(parsed_json.length).to eq(40)
    end

    it "gets details for specific movie", :vcr do
      fight_club = MovieService.movie_details(550)

      expect(fight_club).to include :title, :vote_average, :runtime, :genres, :overview
      expect(fight_club[:title]).to be_a(String)
      expect(fight_club[:vote_average]).to be_a(Float)
    end
  end
end
