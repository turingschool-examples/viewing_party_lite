require 'rails_helper'

RSpec.describe MovieService do 
  describe 'get_top_movies' do 
    it 'should return the top 20 Movie objects' do

      service = MovieService.new
      response = service.get_top_movies 

      expect(response.size).to eq(20)
      response.each do |movie|
        expect(movie).to be_a(Movie)
        expect(movie.id).to_not be(nil)
        expect(movie.title).to_not be(nil)
        expect(movie.vote_average).to_not be(nil)
      end
      expect(response.first.id).to eq(238)
      expect(response.first.title).to eq("The Godfather")
      expect(response.first.vote_average).to eq(8.7)
    end
  end
end
