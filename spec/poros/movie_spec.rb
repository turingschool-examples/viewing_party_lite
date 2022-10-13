require "rails_helper"

RSpec.describe Movie do
  it "can create instance of movie" do
    attrs = {
        title: "The Godfather",
        vote_average: 8.9,
        id: 4,
        genres: [{name: "Drama"},
                {name: "Crime"}]
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Godfather")
    expect(movie.vote_average).to eq(8.9)
    expect(movie.id).to eq(4)
  end
end
