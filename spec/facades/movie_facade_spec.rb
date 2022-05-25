require "rails_helper"

RSpec.describe "Movie Facade" do
  it "returns top rated movies movies", :vcr do
    movies = MovieFacade.top_rated_movies

    expect(movies).to be_a Array
    expect(movies).to be_all Movie
  end

  it "searches for movies by keywords", :vcr do
    movies = MovieFacade.search("shawshank")

    expect(movies).to be_a Array
    expect(movies).to be_all Movie
  end

  it "finds movie details by id", :vcr do
    movie = MovieFacade.movie_details(278)

    expect(movie).to be_a MovieDetails
  end
end
