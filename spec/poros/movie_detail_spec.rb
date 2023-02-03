require 'rails_helper'

RSpec.describe MovieDetail do 
  before :each do 
    @data = {
      "adult": false,
      "backdrop_path": "/l6hQWH9eDksNJNiXWYRkWqikOdu.jpg",
      "budget": 60000000,
      "genres": [
          {
              "id": 14,
              "name": "Fantasy"
          },
          {
              "id": 18,
              "name": "Drama"
          },
          {
              "id": 80,
              "name": "Crime"
          }
      ],
      "homepage": "http://thegreenmile.warnerbros.com/",
      "id": 497,
      "imdb_id": "tt0120689",
      "original_language": "en",
      "original_title": "The Green Mile",
      "overview": "A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.",
      "popularity": 126.022,
      "poster_path": "/velWPhVMQeQKcxggNEU8YmIo52R.jpg",
      "production_companies": [
          {
              "id": 97,
              "logo_path": "/7znWcbDd4PcJzJUlJxYqAlPPykp.png",
              "name": "Castle Rock Entertainment",
              "origin_country": "US"
          },
          {
              "id": 174,
              "logo_path": "/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png",
              "name": "Warner Bros. Pictures",
              "origin_country": "US"
          },
          {
              "id": 3982,
              "logo_path": "/bli7HkPOXOEWsDwDK0W7XXfeUU2.png",
              "name": "Darkwoods Productions",
              "origin_country": "US"
          }
      ],
      "production_countries": [
          {
              "iso_3166_1": "US",
              "name": "United States of America"
          }
      ],
      "release_date": "1999-12-10",
      "revenue": 286801374,
      "runtime": 189,
      "spoken_languages": [
          {
              "english_name": "French",
              "iso_639_1": "fr",
              "name": "Français"
          },
          {
              "english_name": "English",
              "iso_639_1": "en",
              "name": "English"
          }
      ],
      "status": "Released",
      "tagline": "Miracles do happen.",
      "title": "The Green Mile",
      "video": false,
      "vote_average": 8.507,
      "vote_count": 14983
    }
  end 

    it 'exists and has attributes' do 

    movie = MovieDetail.new(@data)

    expect(movie).to be_an_instance_of(MovieDetail)
    expect(movie.title).to eq("The Green Mile")
    expect(movie.vote_average).to eq(8.507)
    expect(movie.runtime).to eq(189)
    expect(movie.genres).to eq([
      {
          "id": 14,
          "name": "Fantasy"
      },
      {
          "id": 18,
          "name": "Drama"
      },
      {
          "id": 80,
          "name": "Crime"
      }
    ])
    expect(movie.overview).to eq("A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.")
  end

  describe 'list_genres' do 
    it 'can list out the name of each genre for the movie' do 
        movie = MovieDetail.new(@data)

        expect(movie.list_genres).to eq("Fantasy, Drama, Crime")
    end 
  end
end