require 'rails_helper'

RSpec.describe Movie do
  it 'initializes with a hash of data' do
    data = {
      id: 1,
      title: 'The Shawshank Redemption',
      vote_average: 9.3
    }

    movie = Movie.new(data)

    expect(movie.id).to eq(1)
    expect(movie.title).to eq('The Shawshank Redemption')
    expect(movie.vote_average).to eq(9.3)
  end
end