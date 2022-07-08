# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieFacade' do
  it 'gives me an array of movie objects', :vcr do
    movies = MovieFacade.top_20_movies

    expect(movies).to be_a Array
    expect(movies).to be_all Movie
  end

  it "returns movies based on query", :vcr do
    movies = MovieFacade.movie_by_keyword("Django")

    expect(movies).to be_a Array
    expect(movies).to be_all Movie

    expect(movies.first.title).to eq("Django Unchained")
    expect(movies.length).to eq(40)
  end
end
