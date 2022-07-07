# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'returns data for the top 20 movies', :vcr do
        movies = MovieService.top_rated_movies(1)

        expect(movies[:results]).to be_an(Array)
        expect(movies[:results].length).to eq(20)
        first_movie = movies[:results].first

        expect(first_movie[:title]).to be_a(String)
        expect(first_movie[:vote_average]).to be_a(Float)
      end
    end

    describe '#search' do
      it 'returns movies that include the keyword searched in their titles', :vcr do
        movies = MovieService.search("titanic", 1)

        expect(movies[:results]).to be_an(Array)

        movies[:results].each do |movie|
          expect(movie[:title]).to include("Titanic")
          expect(movie[:title]).to be_a(String)
        end

      end
    end
  end
end
