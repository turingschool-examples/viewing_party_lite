require 'rails_helper'

RSpec.describe MoviesFacade do 
  before :each do 
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
    .to_return(status: 200, body: File.read('./spec/fixtures/top_rated_movies_response.json'), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/discover_movies_response.json'), headers: {})
  
    stub_request(:get, "https://api.themoviedb.org/3/movie/497?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/green_mile/details_response.json'), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/497/credits?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: File.read('./spec/fixtures/green_mile/credits_response.json'), headers: {})
  end

  it 'can return the collection of movie result objects' do 
    movies = MoviesFacade.search_results("Boots")

    expect(movies).to be_a Array 
    movies.each do |movie|
      expect(movie).to be_an_instance_of(MovieResult)
    end
  end

  it 'can return the collection of top rated movies' do 
    movies = MoviesFacade.top_movies 

    expect(movies).to be_a Array 
    movies.each do |movie|
      expect(movie).to be_an_instance_of(MovieResult)
    end
  end

  it 'can return the movie object' do 
    movie = MoviesFacade.movie_details(497)

    expect(movie).to be_an_instance_of(MovieDetail)
  end

  it 'can return the movie credit object' do 
    movie = MoviesFacade.movie_credits(497)

    expect(movie).to be_an_instance_of(MovieCredit)
  end
end