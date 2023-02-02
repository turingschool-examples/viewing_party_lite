require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      id: 550,
      original_title: 'Fight Club',
      vote_average: 8.4
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(550)
    expect(movie.original_title).to eq('Fight Club')
    expect(movie.vote_average).to eq(8.4)
  end
end