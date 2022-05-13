require "rails_helper"

RSpec.describe "Movie Poro" do
  it "exists and has attributes" do
    movie1 = Movie.new(title: "Who Killed Mike Dao", vote_average: 10, id: 20)

    expect(movie1).to be_a(Movie)
    expect(movie1.id).to eq(20)
    expect(movie1.title).to eq("Who Killed Mike Dao")
    expect(movie1.vote_average).to eq(10)
  end
end
