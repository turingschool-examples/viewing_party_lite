require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      id: 550,
      title: 'Fight Club',
      runtime: 139,
      vote_average: 8.4
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(550)
    expect(movie.title).to eq('Fight Club')
    expect(movie.runtime).to eq(139)
    expect(movie.vote_average).to eq(8.4)
  end
end
