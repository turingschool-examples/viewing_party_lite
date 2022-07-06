require 'rails_helper'

RSpec.describe Movie do

  it 'exists' do
    attributes = {
      id: "2",
      title: "Scream",
      vote_average: "5"
    }

    movie = Movie.new(attributes)

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.title).to eq("Scream")
    expect(movie.id).to eq("2")
    expect(movie.vote_average).to eq("5")
  end
end
