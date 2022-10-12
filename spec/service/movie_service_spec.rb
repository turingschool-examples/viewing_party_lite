require 'rails_helper'

RSpec.describe 'movie service' do
  it 'can connect to the movie db and return top rated', vcr: 'top_rated.json' do
    # json_response = File.read('./spec/fixtures/top_rated.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV.fetch('api_key', nil)}").to_return(status: 200, body: json_response)
    top_rated = MovieService.top_rated
    expect(top_rated).to be_a Hash
    expect(top_rated[:results]).to be_a Array
    expect(top_rated[:results][0]).to include(:title, :vote_average)
  end
end
