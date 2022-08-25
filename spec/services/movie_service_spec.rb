require 'rails_helper'

RSpec.describe 'Movie Service' do
  it 'retrieves movie data through search', :vcr do
    parsed_json = MovieService.search('Arrival')

    expect(parsed_json[:results]).to be_a(Array)
    expect(parsed_json[:results][0]).to have_key(:vote_average)
  end

  it 'retrieves top rated movies', :vcr do
    parsed_json = MovieService.top_rated

    expect(parsed_json[:results]).to be_a(Array)
    expect(parsed_json[:results][0]).to have_key(:vote_average)
  end
end
