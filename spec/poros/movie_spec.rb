require 'rails_helper'

RSpec.describe Movie do
  it 'exists and has attributes' do
    movie = Movie.new({ title: 'Fight Club', vote_average: 8.4, id: 550 })

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.title).to eq('Fight Club')
    expect(movie.vote_average).to eq(8.4)
    expect(movie.id).to eq(550)
  end
end
