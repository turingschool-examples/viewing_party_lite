require 'rails_helper'

RSpec.describe SearchMovie do
  it 'exists' do
    search_movie_data = {
      "adult": false,
      "backdrop_path": "/7ABsaBkO1jA2psC8Hy4IDhkID4h.jpg",
      "genre_ids": [
      28,
      12,
      14,
      878
      ],
      "id": 19995,
      "original_language": "en",
      "original_title": "Avatar",
      "overview": "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.",
      "popularity": 879.501,
      "poster_path": "/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg",
      "release_date": "2009-12-15",
      "title": "Avatar",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 26307
    }

    movie = SearchMovie.new(search_movie_data)

    expect(movie).to be_a SearchMovie
    expect(movie.id).to eq(19995)
    expect(movie.title).to eq('Avatar')
    expect(movie.vote_average).to eq(7.5)
  end
end