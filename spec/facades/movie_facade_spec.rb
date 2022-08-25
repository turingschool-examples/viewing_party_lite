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
  end
end
