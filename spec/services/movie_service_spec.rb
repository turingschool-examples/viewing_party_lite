require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#get_movies" do
      it "returns movie data", :vcr do
        search = MovieService.get_movies('lion')
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie = search[:results].first

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :id
        expect(movie[:id]).to be_an(Integer)

        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a(Float)
      end
    end

    context '#movie_by_id' do
      it 'returns a single movie', :vcr do
        movie = MovieService.movie_by_id(550)
        expect(movie).to be_a Hash

        expect(movie).to have_key :genres
        expect(movie[:genres]).to be_an Array

        expect(movie).to have_key :poster_path
        expect(movie[:poster_path]).to be_a String

        expect(movie).to have_key :vote_count
        expect(movie[:vote_count]).to be_a Integer
      end
    end
  end
end