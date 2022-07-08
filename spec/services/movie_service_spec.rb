require 'rails_helper'

RSpec.describe 'MovieService' do
  context 'happy path' do
    it 'retrieves data and parses response', :vcr do

      parsed_json = MovieService.new.top_40_rated_movies

      expect(parsed_json).to be_a Array
      movie = parsed_json.first

      expect(movie).to include :title, :vote_average
      expect(movie[:title]).to be_a(String)
      expect(movie[:vote_average]).to be_a(Float)
    end
  end
end