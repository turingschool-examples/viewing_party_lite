require 'rails_helper'

RSpec.describe MovieFacade do
  it '.top_movies' do
    top_movies = MovieFacade.top_movies

    expect(top_movies).to be_a Array
    top_movies.each do |top_movie|
      expect(top_movie).to be_a Movie
    end
  end

  it '.search_for_movie' do
    searched_movies = MovieFacade.search_for_movie(100)

    expect(searched_movies).to be_a Array
    searched_movies.each do |searched_movie|
      expect(searched_movie).to be_a Movie
    end
  end

  it '.movie_info' do
    movie_info = MovieFacade.movie_info(100)

    expect(movie_info).to be_a Movie
  end

  it '.reviews' do
    reviews = MovieFacade.reviews(100)

    expect(reviews).to be_a Array
    reviews.each do |review|
      expect(review).to be_a Review
    end
  end

  it '.cast' do
    casts = MovieFacade.cast(100)

    expect(casts).to be_a Array
    casts.each do |cast|
      expect(cast).to be_a Cast
    end
  end
end
