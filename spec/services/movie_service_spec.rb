require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    describe '.top_rated_movies' do
      it 'returns top rated movies data' do
        search = MovieService.top_rated_movies

        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    describe '.keyword_search' do
      it 'returns data based on keyword' do
        search = MovieService.keyword_search("Lego")

        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
    
    describe '.detail_search' do
      it 'returns detailed data for supplied movie' do
        search = MovieService.detail_search("238")
        
        expect(search).to be_a Hash
        
        expect(search).to have_key :title
        expect(search[:title]).to be_a(String)
        
        expect(search).to have_key :id
        expect(search[:id]).to be_a(Integer)
        
        expect(search).to have_key :vote_average
        expect(search[:vote_average]).to be_a(Float)

        expect(search).to have_key :genres
        expect(search[:genres]).to be_an Array
        expect(search[:genres].first).to have_key :name
        expect(search[:genres].first[:name]).to be_a String
        
        expect(search).to have_key :runtime
        expect(search[:runtime]).to be_an Integer
        
        expect(search).to have_key :overview
        expect(search[:overview]).to be_a String
        
        expect(search[:credits]).to have_key :cast
        expect(search[:credits][:cast]).to be_an Array
        expect(search[:credits][:cast].first).to have_key :name
        expect(search[:credits][:cast].first[:name]).to be_a String
        expect(search[:credits][:cast].first).to have_key :character
        expect(search[:credits][:cast].first[:character]).to be_a String

        expect(search[:reviews][:results]).to be_an Array
        expect(search[:reviews][:results].first).to have_key :author
        expect(search[:reviews][:results].first).to have_key :content
        expect(search[:reviews][:results].first[:author]).to be_a String
        expect(search[:reviews][:results].first[:content]).to be_a String
      end
    end
  end
end