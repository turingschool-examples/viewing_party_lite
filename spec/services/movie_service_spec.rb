# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieService' do
  context 'happy path' do
    # input - US state
    # output - parsed JSON is the output
    it 'returns top 20 movies', :vcr do
      parsed_json = MovieService.top_20_movies

      expect(parsed_json).to be_a Array
      # expect(parsed_json[:results]).to be_a Array
      movie = parsed_json.first
      # binding.pry
      #
      # expect(movie).to have_key(:name)
      expect(movie).to include :title, :vote_average
      expect(movie[:title]).to be_a(String)
      expect(movie[:vote_average]).to be_a(Float)
    end
  end
end
