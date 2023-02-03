require 'rails_helper'

RSpec.describe MovieService do
  describe '#movie_details' do
    it 'gets movie data' do
      json_response1 = File.read('spec/fixtures/fight_club_details.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=5b03ee47af6e087159e9baca0f110161").to_return(status: 200, body: json_response1, headers: {})
      
      json_response2 = File.read('spec/fixtures/fight_club_cast.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US").to_return(status: 200, body: json_response2, headers: {})
        
      json_response3 = File.read('spec/fixtures/fight_club_reviews.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US&page=1").to_return(status: 200, body: json_response3, headers: {})

      ms = MovieService.new
      data = ms.movie_details(550)

      expect(data.length).to eq(3)
      expect(data[0]).to be_a(Hash)
      expect(data[1]).to be_a(Array)
      expect(data[2]).to be_a(Hash)
    end
  end

  describe '#search_movies' do
    it 'gets search results' do
      json_response = File.read('spec/fixtures/fight_movies.json')

      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=5b03ee47af6e087159e9baca0f110161&query=Fight")
        .to_return(status: 200, body: json_response, headers: {})
      ms = MovieService.new
      data = ms.search_movies('Fight')

      expect(data.length).to eq(20)
      expect(data).to be_a(Array)
    end
  end

  describe '#top_rated_movies' do
    it 'gets top rated movies' do
      json_response = File.read('spec/fixtures/top_rated_movies.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=5b03ee47af6e087159e9baca0f110161")
        .to_return(status: 200, body: json_response, headers: {})
      ms = MovieService.new
      data = ms.top_rated_movies

      expect(data.length).to eq(20)
      expect(data).to be_a(Array)
    end
  end
end