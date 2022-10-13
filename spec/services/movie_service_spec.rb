require 'rails_helper'

RSpec.describe MovieService do
  describe 'api endpoint' do
    it 'can get_movie_data', :vcr do
      # json_response = File.read('spec/fixtures/get_movie_data.json')
      # stub_request(:get, "https://api.themoviedb.org/3/movie/8?api_key=791558f2c56bc172d18d3788419a5636&language=en-US").to_return(status: 200, body: json_response)
      
      movie_data = MovieService.get_movie_data(8)

      expect(movie_data).to be_a(Hash)
      expect(movie_data).to have_key :title
      expect(movie_data[:title]).to be_a(String)
      expect(movie_data).to have_key :poster_path
      expect(movie_data[:poster_path]).to be_a(String)
      expect(movie_data).to have_key :vote_average
      expect(movie_data[:vote_average]).to be_a(Float)
      expect(movie_data).to have_key :runtime
      expect(movie_data[:runtime]).to be_a(Integer)
      expect(movie_data).to have_key :genres
      expect(movie_data[:genres]).to be_an(Array)
      expect(movie_data).to have_key :overview
      expect(movie_data[:overview]).to be_an(String)
    end
  end
end