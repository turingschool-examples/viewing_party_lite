# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieLite do
  before(:each) do
    VCR.use_cassette('search_godfather') do
      data = MoviesService.search('godfather')[:results].first
      @movie = MovieLite.new(data)
    end
  end

  it 'has movie info based on api call' do
    expect(@movie.id).to be_a Integer
    expect(@movie.movie_title).to be_a String
    expect(@movie.vote_average).to be_a Float
  end
end
