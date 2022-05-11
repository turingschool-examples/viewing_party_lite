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
      genres: [
        {id: 35, name: "Drama"},
        {id: 42, name: "Comedy"}
      ],
      runtime: 190,
      overview: "this is a movie"
    }

    movie = Movie.new(attr)

    expect(movie.id).to eq(0)
    expect(movie.title).to eq("Movie One")
    expect(movie.vote_average).to eq(7.0)
    expect(movie.genres).to be_a Array
    expect(movie.genres[0]).to be_a Hash
    expect(movie.genres[0][:name]).to eq("Drama")
    expect(movie.genres[1][:name]).to eq("Comedy")
    expect(movie.runtime).to eq(190)
    expect(movie.summary).to eq("this is a movie")
  end

  it "can convert runtime to hours and minutes" do
    attr = {
      id: 0,
      title: "Movie One",
      vote_average: 7.0,
      genres: [
        {id: 35, name: "Drama"},
        {id: 42, name: "Comedy"}
      ],
      runtime: 190,
      overview: "this is a movie"
    }

    movie = Movie.new(attr)

    expect(movie.formatted_runtime).to eq("3 Hours and 10 Minutes")
  end
end
