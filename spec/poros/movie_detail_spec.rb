# frozen_string_literal: true

require 'rails_helper'
require './app/poros/movie_detail'
require './app/services/movie_service'

RSpec.describe MovieDetail do
  before :each do
    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.4'
        }
      )
      .to_return(status: 200, body: json_response, headers: {})

    @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true))
  end

  it 'exists and has attributes' do
    expect(@movie_detail).to be_a(MovieDetail)
    expect(@movie_detail.title).to eq('The Godfather')
    expect(@movie_detail.id).to eq(238)
    expect(@movie_detail.summary).to be_a(String)
    expect(@movie_detail.genres).to be_a(Array)
    expect(@movie_detail.runtime).to eq(175)
    expect(@movie_detail.vote_average).to eq(8.714)
    expect(@movie_detail.vote_count).to eq(17_392)
    expect(@movie_detail.image_url).to eq('/tmU7GeKVybMWFButWEGl2M4GeiP.jpg')
  end
end
