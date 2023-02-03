# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})

    json_response2 = File.read('spec/fixtures/cast.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response2, headers: {})

    json_response3 = File.read('spec/fixtures/image.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/images?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response3, headers: {})
  end

  it 'returns a movie' do
    id = 238
    movie = MovieService.get_movie(id)

    expect(movie).to be_a(Hash)
    expect(movie[:original_title]).to eq('The Godfather')
    expect(movie).to have_key(:id)
  end

  it 'can return the first ten actors in a movie' do
    id = 238
    cast = MovieFacade.top_cast(id)

    expect(cast).to be_an(Array)
    expect(cast.count).to eq(10)
  end
end
