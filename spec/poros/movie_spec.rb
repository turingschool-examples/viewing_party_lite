require "rails_helper"

describe Movie do
  it "exists with only partial attributes" do
    attr = {
      id: 0,
      title: "Movie One",
      vote_average: 7.0
    }
    movie = Movie.new(attr)

    expect(movie.id).to eq(0)
    expect(movie.title).to eq("Movie One")
    expect(movie.vote_average).to eq(7.0)
    expect(movie.genres).to eq(nil)
    expect(movie.runtime).to eq(nil)
    expect(movie.summary).to eq(nil)
  end

  it "exists with complete attributes" do
    attr = {
      id: 0,
      title: "Movie One",
      vote_average: 7.0,
      genres: ["drama", "comedy"],
      runtime: 190,
      summary: "this is a movie"
    }

    movie = Movie.new(attr)

    expect(movie.id).to eq(0)
    expect(movie.title).to eq("Movie One")
    expect(movie.vote_average).to eq(7.0)
    expect(movie.genres).to eq(["drama", "comedy"])
    expect(movie.runtime).to eq(190)
    expect(movie.summary).to eq("this is a movie")
  end
end
