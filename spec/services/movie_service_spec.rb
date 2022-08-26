require 'rails_helper'

RSpec.describe 'MovieService' do
  it 'retrieves movies by id', :vcr do
    parsed_json = MovieService.details(244_786)
    expect(parsed_json).to be_a Hash
    expect(parsed_json).to include(:poster_path, :original_title)
    expect(parsed_json[:poster_path]).to be_a String
    expect(parsed_json[:original_title]).to be_a String
  end

  it 'retrieves top rated movies', :vcr do
    parsed_json = MovieService.top_rated

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    top_movie = parsed_json[:results][0]
    expect(top_movie).to include(:id, :title, :vote_average)
    expect(top_movie[:id]).to be_a Integer
    expect(top_movie[:title]).to be_a String
    expect(top_movie[:vote_average]).to be_a Float
  end

  it 'retrieves movies matching the search', :vcr do
    parsed_json = MovieService.search('days of summer')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    first_result = parsed_json[:results][0]
    expect(first_result).to include(:id, :title, :vote_average)
    expect(first_result[:id]).to be_a Integer
    expect(first_result[:title]).to be_a String
    expect(first_result[:vote_average]).to be_a Float
  end
end
