require 'rails_helper'

RSpec.describe 'MovieService' do
  it 'retrieves movie data and parses response' do
    parsed_json = MovieService.top_rated

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    movie = parsed_json[:results].first

    expect(movie).to include :id, :title, :vote_average
    expect(movie[:title]).to be_a String
  end

  it 'searches for movies by user input and returns array of movies' do
    query = 'something'
    search = MovieService.search(query)
    movie = search.first

    expect(search).to be_a Array
    expect(movie).to be_a Hash
    expect(movie).to include :id, :title, :vote_average
    expect(movie[:title]).to be_a String
  end
end
