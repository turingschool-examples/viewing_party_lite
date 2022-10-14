require 'rails_helper'

RSpec.describe MovieService do
  context "class methods" do
    it 'returns movie data' do
      search = MovieService.get_movie_data(238)

      expect(search).to be_a Hash

      expect(search).to have_key :genres
      expect(search[:genres]).to be_an Array
      expect(search).to have_key :id
      expect(search[:id]).to be_an Integer
      expect(search).to have_key :overview
      expect(search[:overview]).to be_a String
      expect(search).to have_key :runtime
      expect(search[:runtime]).to be_a Integer
      expect(search).to have_key :title
      expect(search[:title]).to be_a String
      expect(search).to have_key :vote_average
      expect(search[:vote_average]).to be_a Float
    end

    it 'returns cast data' do
      search = MovieService.get_cast_data(238)

      expect(search).to be_a Hash
      expect(search[:cast]).to be_an Array
      cast_data = search[:cast].first

      expect(cast_data).to have_key :name
      expect(cast_data[:name]).to be_a String
      expect(cast_data).to have_key :character
      expect(cast_data[:character]).to be_a String
    end

    it 'returns review data' do
      search = MovieService.get_review_data(238)

      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      review_data = search[:results].first

      expect(review_data).to have_key :author
      expect(review_data[:author]).to be_a String
      expect(review_data).to have_key :content
      expect(review_data[:content]).to be_a String
    end

    it 'returns search data' do
      search = MovieService.get_search_data("Avatar")

      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      search_data = search[:results].first

      expect(search_data).to have_key :id
      expect(search_data[:id]).to be_an Integer
      expect(search_data).to have_key :title
      expect(search_data[:title]).to be_a String
      expect(search_data).to have_key :vote_average
      expect(search_data[:vote_average]).to be_an Float
    end

    it 'returns top_movie data' do
      search = MovieService.get_top_movie_data

      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      search_data = search[:results].first

      expect(search_data).to have_key :id
      expect(search_data[:id]).to be_an Integer
      expect(search_data).to have_key :title
      expect(search_data[:title]).to be_a String
      expect(search_data).to have_key :vote_average
      expect(search_data[:vote_average]).to be_an Float
      expect(search_data.count).to eq(20)
    end
  end
end