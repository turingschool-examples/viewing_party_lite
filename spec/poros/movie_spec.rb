require 'rails_helper' 

RSpec.describe 'Movie' do 
  it 'exists and has a poster and a title' do 
    data = {
    "adult": false,
    "backdrop_path": "/5h8VtV4oh2qkO8Iqz7gypIYJPAr.jpg",
    "belongs_to_collection": nil,
    "budget": 3300000,
    "genres": [
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 10402,
            "name": "Music"
        }
    ],
    "homepage": "http://sonyclassics.com/whiplash/",
    "id": 244786,
    "imdb_id": "tt2582802",
    "original_language": "en",
    "original_title": "Whiplash",
    "overview": "Under the direction of a ruthless instructor, a talented young drummer begins to pursue perfection at any cost, even his humanity.",
    "popularity": 58.816,
    "poster_path": "/oPxnRhyAIzJKGUEdSiwTJQBa3NM.jpg",
    "production_companies": [
        {
            "id": 2266,
            "logo_path": "/owzVs2mguyyJ3vIn7EbgowpUPnk.png",
            "name": "Bold Films",
            "origin_country": "US"
        },
        {
            "id": 3172,
            "logo_path": "/kDedjRZwO8uyFhuHamomOhN6fzG.png",
            "name": "Blumhouse Productions",
            "origin_country": "US"
        },
        {
            "id": 32157,
            "logo_path": "/4hOCk25Ce8s242NItnwtV7aKRWY.png",
            "name": "Right of Way Films",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2014-10-10",
    "revenue": 13092000,
    "runtime": 107,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "The road to greatness can take you to the edge.",
    "title": "Whiplash",
    "video": false,
    "vote_average": 8.37,
    "vote_count": 12477
    }

    movie = Movie.new(data)

    expect(movie).to be_a Movie 
    expect(movie.poster).to eq data[:poster_path]
    expect(movie.title).to eq data[:original_title]

  end
end