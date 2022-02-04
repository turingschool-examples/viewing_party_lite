require "rails_helper"

RSpec.describe MovieResults do
  it "exists" do
    attributes = {
      title: "title 1",
      id: 1,
      vote_average: 1.1
    }

    movie_1 = MovieResults.new(attributes)
    expect(movie_1).to be_a(MovieResults)
    expect(movie_1.title).to eq("title 1")
    expect(movie_1.id).to eq(1)
    expect(movie_1.vote_average).to eq(1.1)
  end
end
