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

  it 'searches for movies by user input' do
    parsed_json1 = MovieService.search1
    parsed_json2 = MovieService.search2

    expect(parsed_json1).to be_a Hash
    expect(parsed_json2).to be_a Hash
    expect(parsed_json1[:results]).to be_a Array
    expect(parsed_json2[:results]).to be_a Array

    movie1 = parsed_json1[:results].first


    expect(movie1).to include :id, :title, :vote_average
    expect(movie1[:title]).to be_a String
  end
end
