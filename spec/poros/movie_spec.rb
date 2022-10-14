require 'rails_helper'

RSpec.describe Movie do
  before :each do
    fake_data = {
      id: 1,
      original_title: "Sandys Movie",
      runtime: 122,
      vote_count: 1337,
      vote_average: 3.75,
      overview: "Movie I made up on the spot YAY",
      poster_path: "/hereismyimagelink.jpeg",
      genres: [
        {
          "id": 18,
          "name": "Drama"
        },
        {
          "id": 53,
          "name": "Thriller"
        },
        {
          "id": 35,
          "name": "Comedy"
        }
      ],
    }
    @movie = Movie.new(fake_data)
  end
  it 'exists and has attributes' do

    expect(@movie).to be_a(Movie)
    expect(@movie.original_title).to eq("Sandys Movie")
    expect(@movie.runtime).to eq(122)
    expect(@movie.vote_average).to eq(3.75)
    expect(@movie.vote_count).to eq(1337)
    expect(@movie.overview).to be_a(String)
    expect(@movie.image).to include(".jpeg")
    expect(@movie.genres).to be_a(Array)

  end

  it 'can display runtime in standarized format' do
    expect(@movie.standard_runtime).to eq("2hr 2 min")
  end

  it 'can display a list of genre names' do
    expect(@movie.genre_names).to be_a(Array)
    expect(@movie.genre_names).to eq(["Drama", "Thriller", "Comedy"])
  end 
end
