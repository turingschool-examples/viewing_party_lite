require 'rails_helper'

RSpec.describe Movie do
  it "exists and has attributes" do
    data = {
      id: 9999999,
      title: "Super Real Movie",
      vote_average: 8.0,
      runtime: 137,
      original_title: "The Realest Movie to Ever Exist",
      vote_count: 1,
      overview: "Seriously, this movie exists and has attributes."
    }
    movie = Movie.new(data)

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.id).to eq(9999999)
    expect(movie.title).to eq("Super Real Movie")
    expect(movie.vote_average).to eq(8.0)
    expect(movie.runtime).to eq(137)
    expect(movie.original_title).to eq("The Realest Movie to Ever Exist")
    expect(movie.vote_count).to eq(1)
    expect(movie.overview).to eq("Seriously, this movie exists and has attributes.")
  end
end
