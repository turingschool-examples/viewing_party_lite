require 'rails_helper'

RSpec.describe Movie do
  before :each do
    data = {
      "adult": false,
      "backdrop_path": nil,
      "belongs_to_collection": {
        "id": 141_748,
        "name": 'Robot Chicken - Star Wars Collection',
        "poster_path": '/m6tP4z5IIk8lIsBTpXu5H0B8hO3.jpg',
        "backdrop_path": nil
      },
      "budget": 0,
      "genres": [
        {
          "id": 35,
          "name": 'Comedy'
        },
        {
          "id": 878,
          "name": 'Science Fiction'
        },
        {
          "id": 16,
          "name": 'Animation'
        },
        {
          "id": 10_770,
          "name": 'TV Movie'
        }
      ],
      "homepage": '',
      "id": 51_888,
      "imdb_id": 'tt1691338',
      "original_language": 'en',
      "original_title": 'Robot Chicken: Star Wars Episode III',
      "overview": "Robot Chicken: Star Wars Episode III, directed by Chris McKay, combines the satirical sensibilities of Green and Matthew Senreich's Robot Chicken with characters of the Star Wars universe.",
      "popularity": 7.758,
      "poster_path": '/mi2lVho2zpfwcxI6yC1QYJi435D.jpg',
      "production_companies": [
        {
          "id": 1,
          "logo_path": '/o86DbpburjxrqAzEDhXZcyE8pDb.png',
          "name": 'Lucasfilm Ltd.',
          "origin_country": 'US'
        },
        {
          "id": 65_451,
          "logo_path": nil,
          "name": 'Sony Pictures Digital',
          "origin_country": ''
        },
        {
          "id": 67_233,
          "logo_path": '/yDSof0ATfVdv0swak8TAEPFHk0K.png',
          "name": 'Stoopid Monkey',
          "origin_country": 'US'
        },
        {
          "id": 81_667,
          "logo_path": nil,
          "name": 'ShadowMachine',
          "origin_country": 'US'
        }
      ],
      "production_countries": [
        {
          "iso_3166_1": 'US',
          "name": 'United States of America'
        }
      ],
      "release_date": '2010-12-19',
      "revenue": 0,
      "runtime": 45,
      "spoken_languages": [
        {
          "english_name": 'German',
          "iso_639_1": 'de',
          "name": 'Deutsch'
        },
        {
          "english_name": 'English',
          "iso_639_1": 'en',
          "name": 'English'
        }
      ],
      "status": 'Released',
      "tagline": '',
      "title": 'Robot Chicken: Star Wars Episode III',
      "video": false,
      "vote_average": 7.4,
      "vote_count": 123
    }

    @movie = Movie.new(data)
    it 'exists and has attributes' do
      expect(@movie.id).to eq(51_888)
      expect(@movie.poster).to eq('/mi2lVho2zpfwcxI6yC1QYJi435D.jpg')
      expect(@movie.title).to eq('Robot Chicken: Star Wars Episode III')
      expect(@movie.vote_average).to eq(7.4)
      expect(@movie.parsed_runtime).to eq('0 hour(s) 45 min')
      expect(@movie.runtime).to eq(45)
      expect(@movie.genres).to eq(['Comedy', 'Science Fiction', 'Animation', 'TV Movie'])
      expect(@movie.overview).to eq("Robot Chicken: Star Wars Episode III, directed by Chris McKay, combines the satirical sensibilities of Green and Matthew Senreich's Robot Chicken with characters of the Star Wars universe.")
    end

    it 'can convert time to be normal via #time_conversion' do
      expect(@movie.time_conversion(90)).to eq('1 hour(s) 30 min')
    end

    it 'can list all genres in an array' do
      genres = [
        {
          "id": 35,
          "name": 'Very Scary'
        },
        {
          "id": 878,
          "name": 'Science Fiction'
        },
        {
          "id": 16,
          "name": 'blubby flubby'
        },
        {
          "id": 10_770,
          "name": 'Snack Time Movie'
        }
      ]
      expect(@movie.list_genres(genres)).to eq(['Very Scary', 'Science Fiction', 'blubby flubby', 'Snack Time Movie'])
    end
  end
end
