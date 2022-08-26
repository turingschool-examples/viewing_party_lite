require 'rails_helper'

RSpec.describe Movie do
  it 'exists and has title' do
    data =
      {
        "adult": false,
            "backdrop_path": "/htuuuEwAvDVECMpb0ltLLyZyDDt.jpg",
            "genre_ids": [
                18,
                80
            ],
            "id": 238,
            "original_language": "en",
            "original_title": "The Godfather",
            "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
            "popularity": 87.908,
            "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
            "release_date": "1972-03-14",
            "title": "The Godfather",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 16415
        }
      
      movie = Movie.new(data)

      expect(movie).to be_a(Movie)
      expect(movie.title).to eq("The Godfather")
  end
end
