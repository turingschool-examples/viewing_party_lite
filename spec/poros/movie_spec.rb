require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    data = {
      title: 'Endgame',
      vote_average: '9.9',
      id: 278,
      runtime: 144,
      genres: 'Drama',
      overview: 'Amazing',
      cast: 'Robert',
      author: 'Me',
      content: 'Best movie ever'
    }

    movie = Movie.new(data)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq(data[:title])
    expect(movie.vote_average).to eq(data[:vote_average])
    expect(movie.id).to eq(data[:id])
    expect(movie.runtime).to eq(data[:runtime])
    expect(movie.genres).to eq(data[:genres])
    expect(movie.overview).to eq(data[:overview])
    expect(movie.cast).to eq(data[:cast])
    expect(movie.author).to eq(data[:author])
    expect(movie.content).to eq(data[:content])
  end
end