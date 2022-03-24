require 'rails_helper'

RSpec.describe MovieService do
  context 'class methods' do
    context '#connect' do
      it "returns json response" do
        response = MovieService.connect

        expect(response).to be_a Faraday::Connection
      end
    end
    context '#get_movie' do
      it "returns movie data" do
        movie = MovieService.get_movie('550')

        expect(movie).to be_a MovieCall
      end
    end
    context '#top_rated' do
      it "returns 20 movie objects" do
        movie = MovieService.top_rated

        expect(movie.first).to be_a MovieCall
        expect(movie.count).to eq(20)
      end
    end
  end
end
