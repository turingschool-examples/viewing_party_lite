require 'rails_helper'

RSpec.describe MovieFacade do

  it 'creates movie poros for top rated movies', :vcr do
    movies = MovieFacade.top_rated_movies

    expect(movies).to be_an(Array)

    movies.each do |movie|
      expect(movie).to be_an_instance_of(Movie)
    end
  end

  it 'creates cast member poros', :vcr do
    cast_members = MovieFacade.cast_members(278)

    expect(cast_members).to be_an(Array)

    cast_members.each do |cast_member|
      expect(cast_member).to be_an_instance_of(CastMember)
    end
  end

  it 'creates MovieDetails poros', :vcr do
    details = MovieFacade.movie_details(278)

    expect(details).to be_an_instance_of(MovieDetails)
  end

  it 'creates MovieReviews poros', :vcr do
    reviews = MovieFacade.reviews(278)

    expect(reviews).to be_an(Array)

    reviews.each do |review|
      expect(review).to be_a(Reviews)
    end
  end

  it 'creates Movie poros via search query', :vcr do
    movies = MovieFacade.search_movies('godfather')

    expect(movies.first).to be_a(Movie)
  end

  it 'creates MovDetails poros', :vcr do
    details = MovieFacade.search_movie_details('bat')

    details.each do |movie_detail|
      expect(movie_detail).to be_an_instance_of(MovieDetails)
    end
  end
end
