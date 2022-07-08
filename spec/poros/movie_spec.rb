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

  it "gets specific movie details" do
    movie_data =
    {
    "adult": false,
    "backdrop_path": "/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg",
    "belongs_to_collection": nil,
    "budget": 63000000,
    "genres": [
        {
            "id": 18,
            "name": "Drama"
        }
    ],
    "homepage": "http://www.foxmovies.com/movies/fight-club",
    "id": 550,
    "imdb_id": "tt0137523",
    "original_language": "en",
    "original_title": "Fight Club",
    "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
    "popularity": 53.436,
    "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
    "production_companies": [
        {
            "id": 508,
            "logo_path": "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png",
            "name": "Regency Enterprises",
            "origin_country": "US"
        },
        {
            "id": 711,
            "logo_path": "/tEiIH5QesdheJmDAqQwvtN60727.png",
            "name": "Fox 2000 Pictures",
            "origin_country": "US"
        },
        {
            "id": 4700,
            "logo_path": "/A32wmjrs9Psf4zw0uaixF0GXfxq.png",
            "name": "The Linson Company",
            "origin_country": "US"
        },
        {
            "id": 20555,
            "logo_path": "/hD8yEGUBlHOcfHYbujp71vD8gZp.png",
            "name": "Taurus Film",
            "origin_country": "DE"
        },
        {
            "id": 54051,
            "logo_path": nil,
            "name": "Atman Entertainment",
            "origin_country": ""
        },
        {
            "id": 54052,
            "logo_path": nil,
            "name": "Knickerbocker Films",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "DE",
            "name": "Germany"
        },
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "1999-10-15",
    "revenue": 100853753,
    "runtime": 139,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "Mischief. Mayhem. Soap.",
    "title": "Fight Club",
    "video": false,
    "vote_average": 8.4,
    "vote_count": 24346
}
  movie = Movie.new(movie_data)

    expect(movie).to be_a Movie
    expect(movie.title).to eq(movie_data[:title])
    expect(movie.vote_average).to eq(movie_data[:vote_average])
    expect(movie.runtime).to eq(movie_data[:runtime])
    expect(movie.get_genre).to eq(["Drama"])
    expect(movie.overview).to eq(movie_data[:overview])
  end
end
