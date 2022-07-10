require 'rails_helper'

RSpec.describe 'MovieService', :vcr do
  it 'retrieves search data and parses response', :vcr do

    parsed_json = MovieService.search_movie('Harry')
    expect(parsed_json).to be_a Array
    
    expect(parsed_json[0]).to be_a Hash

    movie = parsed_json.first

  end

  it 'retrieves movie data and parses response', :vcr do

    parsed_json = MovieService.movie_details('278')
    
    expect(parsed_json).to be_a Hash
    end
end