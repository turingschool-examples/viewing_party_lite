require 'rails_helper' 

RSpec.describe MoviesService do
  it '#get_top_rated retrieves data and parses response', :vcr do
    parsed_json = MoviesService.get_top_rated
    expect(parsed_json).to be_a Array
    movie = parsed_json.first
    expect(movie).to be_a Hash 
    expect(movie).to include :title, :vote_average
    expect(movie[:title]).to be_a String
    expect(movie[:vote_average]).to be_a Float
  end
end