require 'rails_helper'

RSpec.describe 'Movie Service' do
  describe 'class methods' do

    it 'can establish connection to MovieDB API and return top rated movies', :vcr do
      movies = MovieService.top_rated_movies

      expect(movies).to be_a(Hash)
      expect(movies[:results]).to be_an(Array)
      expect(movies[:results][0][:original_title]).to eq("The Shawshank Redemption")
    end
  end
end
