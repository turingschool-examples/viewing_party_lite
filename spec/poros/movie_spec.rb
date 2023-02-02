require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    data = {
      id: 234,
      title: "Test Movie",
      vote_average: 8.7
    }

    movie = Movie.new(data)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(234)
    expect(movie.title).to eq("Test Movie")
    expect(movie.vote_average).to eq(8.7)
  end
end