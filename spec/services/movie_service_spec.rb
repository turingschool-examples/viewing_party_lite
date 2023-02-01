require 'rails_helper'

RSpec.describe MovieService do 
  describe 'get_top_movies' do 
    it 'should return the top 20 Movie objects' do
      WebMock.stub_request(:any, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["moviedb_key"]}")
             .to_return(body: File.read('./spec/fixtures/top_movies.json'))

      service = MovieService.new
      response = service.get_top_movies 

      expect(response.size).to eq(20)
      response.each do |movie|
        expect(movie).to be_a(Movie)
        expect(movie.id).to_not be(nil)
        expect(movie.title).to_not be(nil)
        expect(movie.vote_average).to_not be(nil)
      end
    end
  end
end