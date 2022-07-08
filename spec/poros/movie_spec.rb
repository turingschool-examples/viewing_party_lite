# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  # input - JSON member response
  # output - member object

  it 'populates Movie fields from JSON response' do
    # we got this from postman using a get
    movie_data =
      {
        "adult": false,
        "backdrop_path": '/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg',
        "genre_ids": [
          18,
          80
        ],
        "id": 278,
        "original_language": 'en',
        "original_title": 'The Shawshank Redemption',
        "overview": 'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.',
        "popularity": 93.363,
        "poster_path": '/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
        "release_date": '1994-09-23',
        "title": 'The Shawshank Redemption',
        "video": false,
        "vote_average": 8.7,
        "vote_count": 21_724
      }
    movie = Movie.new(movie_data)

    expect(movie).to be_a Movie
    expect(movie.title).to eq(movie_data[:title])
    expect(movie.vote_average).to eq(movie_data[:vote_average])
  end
end
