# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  it '.top_movies' do
    results = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
      .to_return(status: 200, body: results)
    top_movies = MovieFacade.top_movies

    expect(top_movies).to be_an Array
    top_movies.each do |movie|
      expect(movie).to be_a Movie
    end
  end
end
