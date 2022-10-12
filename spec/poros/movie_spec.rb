require 'rails_helper'

RSpec.describe Movie do
  it 'has attributes' do
    data = {
          id: 238,
          title: 'The Godfather',
          vote_average: 8.7
        }
    movie = Movie.new(data)

    expect(movie.movie_id).to eq 238
    expect(movie.title).to eq('The Godfather')
    expect(movie.rating).to eq(8.7)
  end
end
