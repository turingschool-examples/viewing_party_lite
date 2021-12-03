require 'rails_helper'

RSpec.describe DetailedMovie do
  it 'has attributes' do
    movie = DetailedMovie.new(movie_details_data)

    expect(movie.title).to eq('The Godfather')
    expect(movie.vote_average).to eq(8.7)
    expect(movie.id).to eq(238)
    expect(movie.runtime).to eq(175)
  end
end
