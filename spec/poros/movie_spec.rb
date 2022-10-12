require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      title: 'The Lion King',
      vote_average: 89,
      id: 450
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq('The Lion King')
    expect(movie.average_votes).to eq(89)
    expect(movie.id).to eq(450)
  end
end
