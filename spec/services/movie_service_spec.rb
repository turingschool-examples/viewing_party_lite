require 'rails_helper'

RSpec.describe 'MovieService', :vcr do
  context 'happy path' do
    it 'retrieves data and parses response' do
      parsed_json = MovieService.get_top_movies

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:results]).to be_a Array

      movie = parsed_json[:results].first

      expect(movie).to include :title, :id, :vote_average
      expect(movie[:title]).to be_a(String)
      expect(movie[:id]).to be_a(Integer)
      expect(movie[:vote_average]).to be_a(Float)
    end
  end
end
