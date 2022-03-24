require 'rails_helper'
require './app/poros/movie_call'

RSpec.describe MovieCall do
  it 'builds a movie object when data is passed in' do
    data = {
      id: "550",
      title: "Fight Club",
      overview: "Description here",
      runtime: 180,
      vote_average: 5.0,
      genres: "Drama",
      poster_path: "movie/poster.jpeg"
    }
    @movie = MovieCall.new(data)

    expect(@movie).to be_an_instance_of(MovieCall)
    expect(@movie.api_id).to eq("550")
    expect(@movie.title).to eq("Fight Club")
    expect(@movie.summary).to eq("Description here")
    expect(@movie.runtime).to eq(180)
    expect(@movie.vote_average).to eq(5.0)
    expect(@movie.genres).to eq("Drama")
    expect(@movie.poster).to eq("movie/poster.jpeg")
  end
end
