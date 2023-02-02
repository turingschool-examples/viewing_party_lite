require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '.top_rated_movies' do
      it 'returns an array of top rated movie objects' do
        expect(MovieFacade.top_rated_movies).to all be_a(Movie)
        expect(MovieFacade.top_rated_movies.length).to eq(20)
      end
    end

    describe '.keyword_search' do
      it 'returns an array of 20 Movie objects based on a keyword search' do
        expect(MovieFacade.keyword_search("Lego")).to all be_a(Movie)
        expect(MovieFacade.keyword_search("Lego").length).to eq(20)
      end
    end
  end
end