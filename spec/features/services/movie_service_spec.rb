require 'rails_helper'

RSpec.describe MovieService do
  describe 'discover movies api connection', :vcr do
    it "get api response for top rated movies" do
      movies = MovieService.get_top_rated
      expect(movies[0]).to be_a(Hash)
      expect(movies.count).to eq(20)
      expect(movies[0][:title]).to be_a(String)
      expect(movies[0][:vote_average]).to be_a(Float)
    end
  end
end



