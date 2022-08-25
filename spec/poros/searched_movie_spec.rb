require 'rails_helper'

RSpec.describe SearchedMovie do
  it 'exists and has attributes' do
    data = {
            "adult": false,
            "id": 278,
            "original_language": "en",
            "original_title": "The Shawshank Redemption",
            "popularity": 108.28,
            "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
            "release_date": "1994-09-23",
            "title": "The Shawshank Redemption",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 22052
  }

    searched_movie = SearchedMovie.new(data)
    expect(searched_movie).to be_a SearchedMovie
    expect(searched_movie.title).to eq(data[:original_title])
    expect(searched_movie.vote_average).to eq(data[:vote_average])
    expect(searched_movie.movie_id).to eq(data[:id])
  end
end