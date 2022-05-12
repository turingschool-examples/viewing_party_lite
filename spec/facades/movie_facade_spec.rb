require 'rails_helper'

RSpec.describe MovieFacade do

  it '.top_movies' do
    movies = MovieFacade.top_movies

    expect(movies).to be_an(Array)

    movies.each do |movie|
      expect(movie).to be_a(Movie)
    end
  end
end
