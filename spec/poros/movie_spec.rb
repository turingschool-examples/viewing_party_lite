require 'rails_helper'

RSpec.describe Movie do
  it 'exists and has attributes' do
    data = { id: 58, title: "Phoenix", vote_average: 7 }
    movie = Movie.new(data)
    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(58)
    expect(movie.title).to eq("Phoenix")
    expect(movie.vote_average).to eq(7)
  end
end