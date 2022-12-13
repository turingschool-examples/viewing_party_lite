require 'rails_helper'

RSpec.describe MovieInfo do
  it 'exists' do
    attributes = {
      id: 1,
      title: "Finding Nemo",
      vote_average: 7.8,
      overview: "Movie about a clown fish",
      genres: [{id: 1, name: "family"}, {id: 2, name: "Animation"}],
      poster_path: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"
    }

    movie = MovieDetail.new(attributes)
    expect(movie).to be_instance_of(MovieDetail)
    expect(movie.id).to eq(1)
    expect(movie.title).to eq("Finding Nemo")
    expect(movie.vote_average).to eq(7.8)
    expect(movie.overview).to eq("Movie about a clown fish")
    expect(movie.genres).to be_a(Array)
    expect(movie.image).to eq("https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
  end
end