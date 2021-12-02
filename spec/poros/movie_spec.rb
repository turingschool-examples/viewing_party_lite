require 'rails_helper'

describe Movie do
  it 'has attributes' do
    movie = Movie.new(original_title: "Red Notice", vote_average: 6.8)

    expect(movie.original_title).to eq("Red Notice")
    expect(movie.vote_average).to eq(6.8)
  end
end
