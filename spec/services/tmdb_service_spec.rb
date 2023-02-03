require 'rails_helper'

RSpec.describe TMDBService do
  describe "get_top_rated_movies" do
    it 'can return 20 top rated movies' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }, query: {"api_key"  => ENV['tmdb_api_key']}).
         to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies.json'), headers: {})

      response = TMDBService.get_top_rated_movies

      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)
      expect(response[:results][0]).to have_key(:title)
      expect(response[:results][0]).to have_key(:vote_average)
    end
  end

  describe "get_movie_search_query" do
    it 'can return movies from a keyword query' do
      keyword = "Encanto"

      stub_request(:get, "https://api.themoviedb.org/3/search/movie")
      .with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }, query: {"api_key"  => ENV['tmdb_api_key'],
          "query" => keyword, 
          "include_adult" => false})
      .to_return(status: 200, body: File.read('spec/fixtures/movie_search.json'), headers: {})
    
      response = TMDBService.get_movie_search_query(keyword)
      
      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)
      expect(response[:results][0]).to have_key(:title)
      expect(response[:results][0]).to have_key(:vote_average)
      expect(response[:results][0]).to have_key(:overview)
      expect(response[:results][0]).to have_key(:id)
    end
  end
end