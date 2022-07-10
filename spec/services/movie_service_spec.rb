require 'rails_helper'

RSpec.describe 'MovieService', :vcr do
  it 'retrieves data and parses response for a group of top movies' do
    parsed_json = MovieService.get_top_movies

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    movie = parsed_json[:results].first

    expect(movie).to include :title, :id, :vote_average
    expect(movie[:title]).to be_a(String)
    expect(movie[:id]).to be_a(Integer)
    expect(movie[:vote_average]).to be_a(Float)
  end

  it 'retrieves data and parses response for a group of movies by search' do
    parsed_json = MovieService.get_movie_search('Pirates')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    movie = parsed_json[:results].first

    expect(movie).to include :title, :id, :vote_average
    expect(movie[:title]).to be_a(String)
    expect(movie[:id]).to be_a(Integer)
    expect(movie[:vote_average]).to be_a(Float)
  end

  it 'retrieves data and parses response for movie credits' do
    parsed_json = MovieService.get_movie_credits(278)

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:cast]).to be_a Array

    member = parsed_json[:cast].first

    expect(member).to include :name, :character
    expect(member[:name]).to be_a(String)
    expect(member[:character]).to be_a(String)
  end

  it 'retrieves data and parses response for movie details' do
    parsed_json = MovieService.get_movie_details(278)

    expect(parsed_json).to be_a Hash

    expect(parsed_json).to include :vote_average, :runtime, :genres, :overview

    expect(parsed_json[:overview]).to be_a(String)
    expect(parsed_json[:vote_average]).to be_a(Float)
    expect(parsed_json[:runtime]).to be_a(Integer)
    expect(parsed_json[:genres]).to be_a(Array)
  end

  it 'retrieves data and parses response for movie reviews' do
    parsed_json = MovieService.get_movie_reviews(278)

    expect(parsed_json).to be_a Hash

    expect(parsed_json[:results]).to be_a Array

    review = parsed_json[:results].first

    expect(review).to include :author, :content

    expect(review[:author]).to be_a(String)
    expect(review[:content]).to be_a(String)
  end
end
