require 'rails_helper'

RSpec.describe MovieFacade do 
  describe '#top_rated' do
    it 'returns top rated movies' do
      results = MovieFacade.top_rated_movies
      expect(results.count).to eq(20)
    end
  end
end