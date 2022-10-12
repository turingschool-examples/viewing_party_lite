require 'rails_helper'

RSpec.describe Movie do

  it 'exists and has attributes' do
    fake_data = {
      id: 1,
      original_title: "Sandys Movie",
      runtime: 120,
      vote_count: 1337,
      vote_average: 3.75,
      overview: "Movie I made up on the spot YAY"
      image: "hereismyimagelink.jpeg"
    }
    movie = Movie.new(fake_data)

    expect(movie).to be_a(Movie)
    expect(movie.original_title).to eq("Sandys Movie")
    expect(movie.runtime).to eq(120)
    expect(movie.vote_average).to eq(3.75)
    expect(movie.vote_count).to eq(1337)
    expect(movie.overview).to be_a(String)
    expect(movie.image).to be_a(String)
  end
end