require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    json_response_1= File.read('spec/fixtures/the_godfather.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response_1)
  end
  it '#connection' do
    expect(MovieService.connection).to be_a(Faraday::Connection)
  end
  it '#parse' do
    expect(MovieService.parse_response("movie/238?api_key=#{ENV['movie_api_key']}&language=en-US")).to be_a(Hash)
  end
  it '#response' do
    expect(MovieService.response("movie/238?api_key=#{ENV['movie_api_key']}&language=en-US")).to be_a(Faraday::Response)
  end
end