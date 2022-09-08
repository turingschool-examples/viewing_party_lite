# frozen_string_literal: true

require 'rails_helper'

describe MovieFacade do
  describe 'class methods' do
    it 'can search (40 results)', vcr: 'search_phoenix' do
      search = MovieFacade.movie_search('phoenix')
      expect(search).to be_a Array
      expect(search.length).to eq(40)
      expect(search).to be_all Movie
    end

    it 'has top 40 rated', vcr: 'top_rated' do
      top_rated = MovieFacade.top_rated
      expect(top_rated).to be_a Array
      expect(top_rated.length).to eq(40)
      expect(top_rated).to be_all Movie
    end
    it 'has movie details', vcr: 'movie_details' do
      # Pass movie id 550 (Fight Club)
      movie_details = MovieFacade.movie_details(550)
      expect(movie_details).to be_a MovieDetails
    end
  end
end
