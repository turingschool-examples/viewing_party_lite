require 'rails_helper'

RSpec.describe 'MovieService' do
  xit 'retrieves search data and parses response', :vcr do

    parsed_json = MovieService.search_movie('Harry')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array
    movie = parsed_json[:results].first

  end

  it 'retrieves movie data and parses response', :vcr do

    parsed_json = MovieService.movie_details('278')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

  end
end