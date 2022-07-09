require 'rails_helper'

RSpec.describe 'Movie Service' do 
  context 'happy path' do 
    it 'retrieves data and parses response', :vcr do
      parsed_json = MovieService.find_top_rated

      expect(parsed_json).to be_a(Hash)
      expect(parsed_json[:results]).to be_a(Array)
      movie = parsed_json[:results].first

      expect(movie).to include(:title, :vote_average)
      expect(movie[:title]).to be_a(String)
      expect(movie[:vote_average]).to be_a(Float)
    end
  end

  context 'sad path' do 

  end
end