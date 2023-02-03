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

  describe "get_movie_by_id" do
    it 'can return movies from movie id' do
      id = 238

      stub_request(:get, "https://api.themoviedb.org/3/movie/#{id}").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }, query: {"api_key"  => ENV['tmdb_api_key']
          }).

      to_return(status: 200, body: File.read('spec/fixtures/movie_by_id.json'), headers: {})


      response = TMDBService.get_movie_by_id(id)

      expect(response).to be_instance_of(MovieResults)
      expect(response.id).to eq(238)
      expect(response.runtime).to eq(175)
      expect(response.title).to eq("The Godfather")
      expect(response.vote_avg).to eq(8.715)
    end
  end

  describe "get_movie_cast" do
    it 'returns cast from movie' do
      movie_id = 238

      stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}/credits").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }, query: {"api_key"  => ENV['tmdb_api_key']})
           .to_return(status: 200, body: File.read('spec/fixtures/movie_credits.json'), headers: {})

      response = TMDBService.get_movie_cast(movie_id)

      expect(response).to have_key(:cast)
      expect(response[:cast]).to be_a(Array)
      expect(response[:cast][0]).to have_key(:name)
      expect(response[:cast][0]).to have_key(:character)
    end
  end

  describe "get_movie_reviews" do
    it 'returns reviews from movie' do
      movie_id = 238

      stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}/reviews").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }, query: {"api_key"  => ENV['tmdb_api_key']})
           .to_return(status: 200, body: File.read('spec/fixtures/movie_reviews.json'), headers: {})

      response = TMDBService.get_movie_reviews(movie_id)

      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)
      expect(response[:results][0]).to have_key(:author)
      expect(response[:results][0]).to have_key(:content)
    end
  end
end