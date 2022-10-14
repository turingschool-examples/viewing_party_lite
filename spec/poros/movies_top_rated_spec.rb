# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesTopRated do
  describe 'movies top rated poros', :vcr do
    before :each do
      @top_rated_movies_array = MovieFacade.top_rated_poro
    end

    it 'instantiates' do
      @top_rated_movies_array.each do |movie|
        expect(movie).to be_a(MoviesTopRated)
      end
    end

    it 'returns an array of moviestoprated object' do
      expect(@top_rated_movies_array).to be_a(Array)

      @top_rated_movies_array.each do |movie|
        expect(movie.name).to be_a(String)
        expect(movie.id).to be_a(Integer)
        if movie.vote_average.is_a? Integer
          expect(movie.vote_average).to be_a(Integer)
        else
          expect(movie.vote_average).to be_a(Float)
        end
      end
    end
  end
end
