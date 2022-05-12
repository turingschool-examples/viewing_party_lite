require "rails_helper"

RSpec.describe MovieDetail do
  it "exists with attributes" do
    data = {
      id: 1,
      title: "Dune",
      vote_average: 7.9,
      overview: "Good movie",
      genres: ["Sci fi", "Adventure"],
      runtime: 155
    }

    dune = MovieDetail.new(data)

    expect(dune).to be_an_instance_of(MovieDetail)
    expect(dune.id).to eq(1)
    expect(dune.title).to eq("Dune")
    expect(dune.vote_average).to eq(7.9)
    expect(dune.runtime).to eq(155)
    expect(dune.genre.first).to eq('Sci fi')
    expect(dune.genre.last).to eq('Adventure')
    expect(dune.summary).to eq('Good movie')
  end
end
