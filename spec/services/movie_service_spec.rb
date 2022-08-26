# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService do
  describe 'methods' do
    it 'returns the top rated movies', :vcr do
      top_rated = MovieService.top_rated_movies
      expect(top_rated[:results]).to be_a(Array)
      expect(top_rated[:results].first[:original_title]).to be_a(String)
    end
  end
end
