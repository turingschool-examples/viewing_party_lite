require "rails_helper"

describe Movie do
  it "exists and has attributes" do
    attr = {
      id: 0,
      title: "Movie One",
      vote_average: 7.0,
    }
    movie = Movie.new(attr)

    expect(movie.id).to eq(0)
    expect(movie.title).to eq("Movie One")
    expect(movie.vote_average).to eq(7.0)
  end
end
