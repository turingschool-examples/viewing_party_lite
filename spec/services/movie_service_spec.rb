require 'rails_helper'

RSpec.describe 'Movie Service' do
  it 'retrieve movie data through search', :vcr do
    parsed_json = MovieService.search('Arrival')

    expect(parsed_json[:results]).to be_a(Array)
    expect(parsed_json[:results][0]).to have_key(:vote_average)
  end
end
