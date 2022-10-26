require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      title: 'The Lion King',
      vote_average: 89,
      id: 450,
      poster_path: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
      runtime: 139,
      genres: [{id: 145, name: 'Action'}, {id: 2, name: 'Romance'}],
      overview: 'This is the overview'
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq('The Lion King')
    expect(movie.average_votes).to eq(89)
    expect(movie.id).to eq(450)
    expect(movie.poster_path).to eq('https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg')
    expect(movie.runtime).to eq(139)
    expect(movie.genres).to eq(%w[Action Romance])
    expect(movie.overview).to eq('This is the overview')
  end
end

