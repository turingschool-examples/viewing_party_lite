# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService do
  it 'returns movie data' do
    results = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
      .to_return(status: 200, body: results)
    search = MovieService.top_rated_movies

    expect(search).to be_a Hash
    expect(search[:results]).to be_an Array
    movie_data = search[:results].first

    expect(movie_data).to have_key(:title)
    expect(movie_data[:title]).to be_a String
  end
end
