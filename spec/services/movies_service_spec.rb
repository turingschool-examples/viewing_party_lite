require 'rails_helper'

RSpec.describe MoviesService do
  describe 'methods' do
    it 'returns the top rated movies' do
      top_rated = MoviesService.top_rated_movies

      expect(top_rated[:results]).to be_a(Array)

      expect(top_rated).to have_key(:results)

      expect(top_rated[:results].first).to have_key(:original_title)
      expect(top_rated[:results].first[:original_title]).to be_a(String)

      expect(top_rated[:results].first).to have_key(:vote_average)
      expect(top_rated[:results].first[:vote_average]).to be_a(Float)

    end
  end
end
