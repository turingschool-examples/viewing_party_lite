require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '.top_rated_movies' do
      it 'returns an array of top rated movie objects' do
        expect(MovieFacade.top_rated_movies).to all be_a(Movie)
        expect(MovieFacade.top_rated_movies.length).to eq(20)
      end
    end
  end
end