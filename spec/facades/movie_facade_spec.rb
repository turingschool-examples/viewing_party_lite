require 'rails_helper'

RSpec.describe MovieFacade do
  it 'can return a collection of movies' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_api_key']}&language=en")
        .to_return(status: 200,
                   body: File.read('spec/fixtures/tmdb_top_response.json'),
                   headers: {})

    movies = MovieFacade.discover('/3/movie/top_rated', { api_key: ENV['tmdb_api_key'],
      language: 'en' })

    expect(movies).to be_a Array
    movies.each do |movie|
      expect(movie).to be_a Movie
    end
  end

  it 'can return a single movie' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/348?api_key=#{ENV['tmdb_api_key']}&language=en&movie_id=348")
      .to_return(status: 200,
                 body: File.read('spec/fixtures/alien_details.json'),
                 headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/348/credits?api_key=#{ENV['tmdb_api_key']}&language=en")
      .to_return(status: 200,
                 body: File.read('spec/fixtures/alien_credits.json'),
                 headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/348/reviews?api_key=#{ENV['tmdb_api_key']}&language=en")
    .to_return(status: 200,
              body: File.read('spec/fixtures/alien_reviews.json'),
              headers: {})

    movie = MovieFacade.details('/3/movie/348', { api_key: ENV['tmdb_api_key'],
      language: 'en',
      movie_id: 348 })

    expect(movie).to be_a Movie
  end
end
