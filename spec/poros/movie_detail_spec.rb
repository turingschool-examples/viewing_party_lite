require 'rails_helper'
require './app/poros/movie_detail'
require './app/services/movie_service'

RSpec.describe MovieDetail do
  before :each do
    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }).
        to_return(status: 200, body: json_response, headers: {})

        # require 'pry'; binding.pry
        @movie_detail = MovieDetail.new(JSON.parse(json_response))
      end

  it 'exists and has attributes' do
    expect(@movie_detail).to be_a(MovieDetail)
    # require 'pry'; binding.pry
    # expect(@movie_detail.title).to eq('The Godfather')
  end
end