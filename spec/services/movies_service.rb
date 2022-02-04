require 'rails_helper'

RSpec.describe MovieService do
  context 'class methods' do
    it "returns member data" do
      VCR.use_cassette('search_data_from_api') do
        search = MovieService.searched_movies('Fight')
        expect(search).to be_a Hash
        expect(search[:results]).to be_a Array

        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a String

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a Float

        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a String

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a Integer
      end
    end
  end
end
