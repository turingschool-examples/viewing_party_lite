require 'rails_helper'

describe Movie do
  it 'has attributes' do
    movie = Movie.new(original_title: "Red Notice", vote_average: 6.8)

    expect(movie.original_title).to eq("Red Notice")
    expect(movie.vote_average).to eq(6.8)
  end

  it 'can get movie details', :vcr do
    movie_result = Movie.new(movie_data)

    expect(movie_result.original_title).to eq("Red Notice")
    expect(movie_result.vote_average).to eq(6.8)
    expect(movie_result.runtime).to eq(116)
    expect(movie_result.overview).to eq("An Interpol-issued Red Notice is a global alert to hunt and capture the world's most wanted. But when a daring heist brings together the FBI's top profiler and two rival criminals, there's no telling what will happen.")
    expect(movie_result.release_date).to eq("2021-11-04")

  end
end
