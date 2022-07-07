# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '#top_rated_movies' do
      it 'returns the top 40 movies', :vcr do
        top_movies = MovieFacade.top_rated_movies

        expect(top_movies.length).to eq(40)
        expect(top_movies.first).to be_a(Movie)
      end
    end

    describe '#first_10_movie_cast' do
      it 'returns the first ten cast members', :vcr do
        first_10_cast = MovieFacade.first_10_cast_members(120)
      end
    end
  end
end
