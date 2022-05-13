require "rails_helper"

RSpec.describe "Movie Service" do
  it "gets top rated movie data", :vcr do
    search = MovieService.top_rated_movies

    expect(search).to be_a Hash
    expect(search[:results]).to be_a Array
    movie_data = search[:results].first

    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a String

    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a Float
  end

  it "searches for movies by keyword", :vcr do
    search = MovieService.search("shawshank")
    
    expect(search).to be_a Hash
    expect(search[:results]).to be_a Array
    movie_data = search[:results].first

    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a String

    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a Float
  end
end
