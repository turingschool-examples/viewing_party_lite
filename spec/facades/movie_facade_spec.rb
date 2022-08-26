require 'rails_helper'

RSpec.describe MovieFacade do
  it 'returns top rated movies', :vcr do
    results = MovieFacade.top_rated_movies
    expect(results.count).to eq(20)
  end

  it '#movies_by_keyword', :vcr do
    results = MovieFacade.movies_keyword_query("Fight Club")
  
    expect(results[0].title).to eq("Fight Club")
  end

  it '#get_movie_details', :vcr do
    movie_details = MovieFacade.get_movie_details(505)

    expect(movie_details).to be_a(MovieDetails)
  end

  it '#movie_reviews', :vcr do
    movie_reviews = MovieFacade.movie_reviews(500)

    expect(movie_reviews.count).to eq(2)
  end
end
