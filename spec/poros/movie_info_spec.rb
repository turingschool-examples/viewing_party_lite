require 'rails_helper'

RSpec.describe MovieInfo do
  it 'exists' do
    attributes = {
      id: 1,
      title: "Finding Nemo",
      vote_average: 7.8,
      genre_ids: [12, 15],
      overview: "Movie about a clown fish",
      vote_count: 1353
    }

    movie = MovieInfo.new(attributes)
    expect(movie).to be_instance_of(MovieInfo)
    expect(movie.id).to eq(1)
    expect(movie.title).to eq("Finding Nemo")
    expect(movie.vote_average).to eq(7.8)
    expect(movie.genre_ids).to eq([12, 15])
    expect(movie.overview).to eq("Movie about a clown fish")
    expect(movie.vote_count).to eq(1353)
  end
end