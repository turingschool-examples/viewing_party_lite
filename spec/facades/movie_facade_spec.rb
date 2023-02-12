require 'rails_helper'

RSpec.describe MovieFacade do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/51888/credits?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_credits_response.json"), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/51888?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})
 
    stub_request(:get, "https://api.themoviedb.org/3/movie/51888/reviews?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/citizen_kane_reviews_response.json"), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key&language=en-US&limit=20").
    to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies_response.json'), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key&query=star%20wars").
    to_return(status: 200, body: File.read('spec/fixtures/search_for_starwars.json'), headers: {})
  end

  describe "Movie Facade Class Methods" do
    it 'can return a list of the top rated movies at a count of 20' do
      top_rated_movies = MovieFacade.top_rated_movies

      expect(top_rated_movies).to be_a(Array)
      
      top_rated_movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end

    it 'can return a list of the searched movies at a count of 20' do
      searched_movies = MovieFacade.search_results("star wars")

      expect(searched_movies).to be_a(Array)

      searched_movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end

    it 'can return a specific ShowMovie' do
      show_movie = MovieFacade.find_movie(51888)

      expect(show_movie).to be_a(ShowMovie)
    end

    it 'can return a list of 10 actors' do
      actors = MovieFacade.find_cast(51888)

      expect(actors).to be_a(Array)

      actors.each do |actor|
        expect(actor).to be_a(MovieActor)
      end
    end

    it 'can return a list of 10 actors sorted by popularity' do
      actors = MovieFacade.cast_by_popularity(51888)

      expect(actors).to be_a(Array)

      actors.each do |actor|
        expect(actor).to be_a(MovieActor)
      end
    end

    it 'can find a list of all a movies reviews' do
      reviews = MovieFacade.find_reviews(51888)

      expect(reviews).to be_a(Array)
      
      reviews.each do |review|
        expect(review).to be_a(MovieReview)
      end
    end
  end
end