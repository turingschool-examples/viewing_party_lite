require 'rails_helper'

RSpec.describe MovieDBService do
  it 'retrieves top rated movie data and parses the response for page 1', :vcr do
    parsed_json = MovieDBService.top_rated_movies_page_1
    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    top_movie_data = parsed_json[:results][0]
    expect(top_movie_data).to include(:original_title, :id, :vote_average)
    expect(top_movie_data[:original_title]).to be_a String
    expect(top_movie_data[:id]).to be_a Integer
    expect(top_movie_data[:vote_average]).to be_a Float
  end

  it 'retrieves top rated movie data and parses the response for page 2', :vcr do
    parsed_json = MovieDBService.top_rated_movies_page_2
    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    top_movie_data = parsed_json[:results][0]
    expect(top_movie_data).to include(:original_title, :id, :vote_average)
    expect(top_movie_data[:original_title]).to be_a String
    expect(top_movie_data[:id]).to be_a Integer
    expect(top_movie_data[:vote_average]).to be_a Float
  end

  it 'retrieves the movies that match the searched keyword', :vcr do
    parsed_json = MovieDBService.find_movie("Shawshank")

    expect(parsed_json).to be_a Hash

    first_searched_movie_data = parsed_json[:results][0]
    expect(first_searched_movie_data).to include(:original_title, :id, :vote_average)
    expect(first_searched_movie_data[:original_title]).to be_a String
    expect(first_searched_movie_data[:id]).to be_a Integer
    expect(first_searched_movie_data[:vote_average]).to be_a Float
  end

  it "retrieves the movie by id", :vcr do
    movie_id = 550
    parsed_json = MovieDBService.get_movie(movie_id)

    movie_data = parsed_json

    expect(movie_data[:title]).to be_a(String)
    expect(movie_data[:vote_average]).to be_a(Float)
    expect(movie_data[:id]).to be_a(Integer)
    expect(movie_data[:runtime]).to be_a(Integer)
    expect(movie_data[:genres]).to be_a(Array)
    expect(movie_data[:overview]).to be_a(String)
    expect(movie_data[:poster_path]).to be_a(String)
  end

  it "returns the cast for a movie by movie id", :vcr do
    movie_id = 550

    parsed_json = MovieDBService.get_cast(movie_id)
    cast_data = parsed_json

    expect(cast_data[0][:name]).to be_a(String)
    expect(cast_data[1][:character]).to be_a(String)
  end

  it "can get reviews from a movie by movie id", :vcr do
    movie_id = 550

    parsed_json = MovieDBService.get_reviews(movie_id)
    review_data = parsed_json

    expect(review_data[0][:author]).to be_a(String)
    expect(review_data[0][:content]).to be_a(String)
  end
end
