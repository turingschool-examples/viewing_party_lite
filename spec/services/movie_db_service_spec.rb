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
end