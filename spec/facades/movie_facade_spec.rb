# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe '.create_top_20_movies', :vcr do
    it 'gets data for top rated movies' do
      movies = MovieFacade.create_top_20_movies

      expect(movies[0]).to be_a Movie
      expect(movies.count).to eq(20)
      expect(movies[1].title).to eq('The Shawshank Redemption')
    end
  end
end
