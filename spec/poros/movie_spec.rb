require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do 
    attrs = {
      id: 1,
      title: "Space Princess",
      vote_average: 10.0
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(1)
    expect(movie.title).to eq("Space Princess")
    expect(movie.vote).to eq(10.0)
  end
end