# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  it 'returns an array of movie objects', :vcr do
    movies = MovieFacade.get_top_movies
    expect(movies).to be_a(Array)
    expect(movies).to be_all(Movie)
  end
end
