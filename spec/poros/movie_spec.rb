require 'rails_helper'

RSpec.describe Movie do

  it 'has details' do
    data = {
            "adult": false,
            "backdrop_path": "/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
            "belongs_to_collection": {
                "id": 230,
                "name": "The Godfather Collection",
                "poster_path": "/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg",
                "backdrop_path": "/3WZTxpgscsmoUk81TuECXdFOD0R.jpg"
            },
            "budget": 6000000,
            "genres": [
                {
                    "id": 18,
                    "name": "Drama"
                },
                {
                    "id": 80,
                    "name": "Crime"
                }
            ],
            "homepage": "http://www.thegodfather.com/",
            "id": 238,
            "imdb_id": "tt0068646",
            "original_language": "en",
            "original_title": "The Godfather",
            "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
            "popularity": 90.069,
            "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
            "production_companies": [
                {
                    "id": 4,
                    "logo_path": "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png",
                    "name": "Paramount",
                    "origin_country": "US"
                },
                {
                    "id": 10211,
                    "logo_path": nil,
                    "name": "Alfran Productions",
                    "origin_country": "US"
                }
            ],
            "production_countries": [
                {
                    "iso_3166_1": "US",
                    "name": "United States of America"
                }
            ],
            "release_date": "1972-03-14",
            "revenue": 245066411,
            "runtime": 175,
            "spoken_languages": [
                {
                    "english_name": "English",
                    "iso_639_1": "en",
                    "name": "English"
                },
                {
                    "english_name": "Italian",
                    "iso_639_1": "it",
                    "name": "Italiano"
                },
                {
                    "english_name": "Latin",
                    "iso_639_1": "la",
                    "name": "Latin"
                }
            ],
            "status": "Released",
            "tagline": "An offer you can't refuse.",
            "title": "The Godfather",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 16188
          }
    movie = Movie.new(data)

    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(238)
    expect(movie.title).to eq("The Godfather")
    expect(movie.runtime).to eq(175)
    expect(movie.vote_average).to eq(8.7)
    expect(movie.genres[0][:name]).to eq("Drama")
    expect(movie.genres[1][:name]).to eq("Crime")
    expect(movie.summary).to eq("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
  end

  it 'populates fields from JSON response' do 
    data = {
      "adult": false,
      "backdrop_path": "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
      "genre_ids": [
          18,
          80
      ],
      "id": 278,
      "original_language": "en",
      "original_title": "The Shawshank Redemption",
      "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "popularity": 85.804,
      "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
      "release_date": "1994-09-23",
      "title": "The Shawshank Redemption",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 21727
    }

    movie = Movie.new(data)

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.title).to eq(data[:title])
    expect(movie.vote_average).to eq(data[:vote_average])
    expect(movie.id).to eq(data[:id])
  end
end

