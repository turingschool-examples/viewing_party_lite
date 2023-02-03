# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe '#movie' do
    it 'returns a specific movie object' do
      movie_facade = MovieFacade.new(14)
      expect(movie_facade.movie).to be_a Movie
      expect(movie_facade.movie.id).to eq 14
    end
  end

  describe '#get_top_movies' do
    it 'returns an array of the top 20 movie objects' do
      movie_facade = MovieFacade.new
      movies = movie_facade.get_top_movies
      expect(movies.length).to eq 20
      expect(movies).to be_a Array
      movies.each do |movie|
        expect(movie).to be_a Movie
      end

      sample_movie = movies.first
      expect(sample_movie.id).to eq(238)
      expect(sample_movie.title).to eq('The Godfather')
      expect(sample_movie.vote_average).to eq(8.7)
    end
  end

  describe '#seach_movies()' do
    it 'returns an array of movie objects based on a search' do
      movie_facade = MovieFacade.new
      movies = movie_facade.search_movies('river')
      expect(movies).to be_a Array
      movies.each do |movie|
        expect(movie).to be_a Movie
      end

      sample_movie = movies.first
      expect(sample_movie.id).to eq(395_834)
      expect(sample_movie.title).to eq('Wind River')
      expect(sample_movie.vote_average).to eq(7.4)
    end
  end
end
