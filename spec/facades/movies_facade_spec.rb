require 'rails_helper'

RSpec.describe MoviesFacade do
  it 'returns collections of top rated movies' do
    VCR.use_cassette('top_rated_movies') do
    result = MoviesFacade.top_rated

    expect(result).to be_an(Array)
    expect(result.first).to be_a(Movie)   
    end
  end
end