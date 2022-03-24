require 'rails_helper'

RSpec.describe 'Movie Details Service' do
  describe 'class methods' do

    it 'can establish connection to MovieDB API and return movie details', :vcr do
       # binding.pry
      mov_details = MovieDetailsService.movie_details(278)
      expect(mov_details).to be_a(Hash)
      expect(mov_details[:overview]).to include("Framed in the 1940s")
      expect(mov_details[:genres][0][:name]).to eq("Drama")
      expect(mov_details[:runtime]).to eq(142)
      # expect(mov_details[:mov_details].first[:name]).to eq("Tom Cruise")
    end
  end
end
