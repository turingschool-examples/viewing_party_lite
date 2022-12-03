require 'rails_helper'

RSpec.describe MovieService, :vcr do 
  context "class methods" do 
    context "#movie_details(movie_id)" do 
      it 'returns a movies details' do
        movie_data = MovieService.movie_details(550)
        expect(movie_data).to be_a Hash
      end
    end

    context '#movie_credits(movie_id)' do
      it 'returns a movies credits' do
        credit_data = MovieService.movie_credits(550)
        expect(credit_data).to be_a Hash
      end
    end

    context '#movie_reviews(movie_id)' do
      it 'returns a movies reviews' do 
        review_data = MovieService.movie_reviews(550)
        expect(review_data).to be_a Hash
      end
    end

    context "#top_rated" do 
      it 'returns a nested hash of top rated movies' do
        VCR.use_cassette('top_rated_service') do
          movie_data = MovieService.top_rated
          expect(movie_data).to be_a Hash
          expect(movie_data[:results]).to be_a Array
          expect(movie_data[:results][0]).to be_a Hash
          expect(movie_data[:results][0][:title]).to be_a String
        end
      end
    end

    context "#search(query)" do 
      it 'returns a movies details' do
        VCR.use_cassette('search_service') do
          movie_data = MovieService.search('a')
          expect(movie_data).to be_a Hash
          expect(movie_data[:results]).to be_a Array
          expect(movie_data[:results][0]).to be_a Hash
          expect(movie_data[:results][0][:title]).to be_a String
        end
      end
    end
  end
end