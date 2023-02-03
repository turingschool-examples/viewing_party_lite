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

  it "exists with details" do
    string = File.read('./spec/fixtures/godfather_details.json')
    data = JSON.parse(string, symbolize_names: true)
    movie = Movie.new(data)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(238)
    expect(movie.title).to eq("The Godfather")
    expect(movie.vote_average).to eq(8.715)

    expect(movie.runtime).to eq(175)
    expect(movie.genres).to eq(["Drama", "Crime"])

    expect(movie.cast.count).to be <= 10
    expect(movie.cast.first).to be_a Hash
    expect(movie.cast.first[:name]).to eq("Marlon Brando")
    expect(movie.cast.first[:character]).to eq("Don Vito Corleone")

    expect(movie.overview).to be_a String

    expect(movie.reviews).to be_an Array
    expect(movie.reviews.first).to be_a Hash
    expect(movie.reviews.first[:author]).to eq("futuretv")
    expect(movie.reviews.first[:content]).to be_a String
  end
end