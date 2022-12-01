require 'rails_helper'

RSpec.describe Movie do
    it 'has title and vote average' do
        data =
     {"adult": false,
        "backdrop_path": "/v7baGyne7CsLxnM2maMwIxKZdVF.jpg",
        "genres": 
        [{"id": 80,
        "name": "Crime"},
        {"id": 18,
        "name": "Drama"}],
        "id": 505,
        "original_language": "en",
        "original_title": "Johnny Handsome",
        "popularity": 8.888,
        "poster_path": "/hdEIkpL17rvfZH0l34FJ8H9LAa.jpg",
        "title": "Johnny Handsome",
        "vote_average": 6.3,
        "vote_count": 199}

        movie = Movie.new(data)

        expect(movie).to be_a(Movie)
        expect(movie.id).to eq(505)
        expect(movie.title).to eq("Johnny Handsome")
        expect(movie.vote_average).to eq(6.3)
  end
end