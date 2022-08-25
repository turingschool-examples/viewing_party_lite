require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = {
      id: 405,
      title: "My Favorite Movie",
      vote_average: 9.9
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.movie_id).to eq(405)
    expect(movie.title).to eq("My Favorite Movie")
    expect(movie.rating).to eq(9.9)
  end
end