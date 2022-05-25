require "rails_helper"

RSpec.describe Movie do
  it "exits" do
    data = {
      title: "Greatest Movie Ever",
      vote_average: 10.0
    }

    movie = Movie.new(data)

    expect(movie.title).to eq("Greatest Movie Ever")
    expect(movie.vote_average).to eq(10.0)
  end
end
