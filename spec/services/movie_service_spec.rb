require 'rails_helper'

RSpec.describe MovieService do
  describe '#top_rated_movies' do
    it 'returns the top rated movies' do
      VCR.insert_cassette 'top rated'
      top = MovieService.new.top_rated_movies
      expect(top).to be_a Hash
      expect(top[:results]).to be_an Array
      top_movies = top[:results].first

      expect(top_movies).to have_key :title
      expect(top_movies[:title]).to be_a(String)

      expect(top_movies).to have_key :vote_average
      expect(top_movies[:vote_average]).to be_a(Float)
      VCR.eject_cassette
    end
  end

  describe '#search' do
    it 'returns the searched results' do
      VCR.insert_cassette 'searches'
      search = MovieService.new.search('princess')
      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      search_movies = search[:results].first

      expect(search_movies).to have_key :title
      expect(search_movies[:title]).to be_a(String)

      expect(search_movies).to have_key :vote_average
      expect(search_movies[:vote_average]).to be_a(Float)
      VCR.eject_cassette
    end
  end

  describe '#find_by_id' do
    it 'returns the movie found by id' do
      VCR.insert_cassette 'movie show'
      movie = MovieService.new.find_by_id(550)
      expect(movie).to be_a Hash

      expect(movie).to have_key :id
      expect(movie[:id]).to be_a(Integer)
  
      expect(movie).to have_key :title
      expect(movie[:title]).to be_a(String)
      
      expect(movie).to have_key :vote_average
      expect(movie[:vote_average]).to be_a(Float)

      expect(movie).to have_key :overview
      expect(movie[:overview]).to be_a(String)

      expect(movie).to have_key :runtime
      expect(movie[:runtime]).to be_a(Integer)

      expect(movie).to have_key :genres
      expect(movie[:genres]).to be_a(Array)

      expect(movie).to have_key :poster_path
      expect(movie[:poster_path]).to be_a(String)
      VCR.eject_cassette
    end
  end

  describe '#find_movie_cast' do
    it 'returns the movie cast' do
      VCR.insert_cassette 'movie show'
      cast = MovieService.new.find_movie_cast(550)
      expect(cast).to be_a Hash
      expect(cast[:cast]).to be_an Array
      character = cast[:cast].first

      expect(character).to have_key :name
      expect(character[:name]).to be_a(String)

      expect(character).to have_key :character
      expect(character[:character]).to be_a(String)
      VCR.eject_cassette
    end
  end

  describe '#find_movie_reviews' do
    it 'returns the movie reviews' do
      VCR.insert_cassette 'movie show'
      reviews = MovieService.new.find_movie_reviews(550)
      expect(reviews).to be_a Hash
      expect(reviews[:results]).to be_an Array
      review = reviews[:results].first

      expect(review).to have_key :author
      expect(review[:author]).to be_a(String)

      expect(review).to have_key :content
      expect(review[:content]).to be_a(String)
      VCR.eject_cassette
    end
  end

  describe '#get_url' do
    it 'parses through the response body and returns a JSON hash with keys as symbols' do
      VCR.insert_cassette 'top rated'
      url = MovieService.new.get_url('https://api.themoviedb.org/3/movie/top_rated')
      expect(url).to be_a Hash
      VCR.eject_cassette
    end
  end

  describe '#conn' do
    it 'connects with the Movie DB API' do
      connection = MovieService.new.conn
      expect(connection.params).to be_a Hash
      expect(connection.params).to have_key :api_key
      expect(connection.params).to have_key :language
    end
  end
end