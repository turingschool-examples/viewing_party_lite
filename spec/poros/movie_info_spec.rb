require 'rails_helper'

RSpec.describe MovieInfo do
  it 'has lots of movie details' do
    data ={
      "adult": false,
      "budget": 42000,
      "genres": [
        {
          "id": 99,
          "name": "Documentary"
        }
      ],
      "homepage": "http://lifeinloops.com",
      "id": 8,
      "imdb_id": "tt0825671",
      "original_language": "en",
      "original_title": "Life in Loops (A Megacities RMX)",
      "overview": "Timo Novotny labels his new project an experimental music documentary film, in a remix of the celebrated film Megacities (1997), a visually refined essay on the hidden faces of several world \"megacities\" by leading Austrian documentarist Michael Glawogger. Novotny complements 30 % of material taken straight from the film (and re-edited) with 70 % as yet unseen footage in which he blends original shots unused by Glawogger with his own sequences (shot by Megacities cameraman Wolfgang Thaler) from Tokyo. Alongside the Japanese metropolis, Life in Loops takes us right into the atmosphere of Mexico City, New York, Moscow and Bombay. This electrifying combination of fascinating film images and an equally compelling soundtrack from Sofa Surfers sets us off on a stunning audiovisual adventure across the continents. The film also makes an original contribution to the discussion on new trends in documentary filmmaking. Written by KARLOVY VARY IFF 2006",
      "popularity": 2.259,
      "poster_path": "/x7Sz339F2oC8mBf0DHCQpKizXaL.jpg",
      "release_date": "2006-01-01",
      "revenue": 0,
      "runtime": 80,
      "spoken_languages": [
        {
          "english_name": "English",
          "iso_639_1": "en",
          "name": "English"
        }
      ],
      "status": "Released",
      "tagline": "A Megacities remix.",
      "title": "Life in Loops (A Megacities RMX)",
      "video": false,
      "vote_average": 7.738,
      "vote_count": 21
    }

    movie_data= MovieInfo.new(data)

    expect(movie_data).to be_a(MovieInfo)
    expect(movie_data.title).to eq('Life in Loops (A Megacities RMX)')
    expect(movie_data.image).to eq('https://image.tmdb.org/t/p/w500/x7Sz339F2oC8mBf0DHCQpKizXaL.jpg')
    expect(movie_data.rating).to eq(7.7)
    expect(movie_data.runtime).to eq(80)
    expect(movie_data.genre).to eq(['Documentary'])
    expect(movie_data.summary).to eq('Timo Novotny labels his new project an experimental music documentary film, in a remix of the celebrated film Megacities (1997), a visually refined essay on the hidden faces of several world "megacities" by leading Austrian documentarist Michael Glawogger. Novotny complements 30 % of material taken straight from the film (and re-edited) with 70 % as yet unseen footage in which he blends original shots unused by Glawogger with his own sequences (shot by Megacities cameraman Wolfgang Thaler) from Tokyo. Alongside the Japanese metropolis, Life in Loops takes us right into the atmosphere of Mexico City, New York, Moscow and Bombay. This electrifying combination of fascinating film images and an equally compelling soundtrack from Sofa Surfers sets us off on a stunning audiovisual adventure across the continents. The film also makes an original contribution to the discussion on new trends in documentary filmmaking. Written by KARLOVY VARY IFF 2006')
  end

  describe 'movie methods' do
    before :each do
      @data_1 = {
      "adult": false,
      "budget": 42000,
      "genres": [
        {
          "id": 99,
          "name": "Documentary"
        }
      ],
      "homepage": "http://lifeinloops.com",
      "id": 8,
      "original_title": "Life in Loops (A Megacities RMX)",
      "overview": "Timo Novotny labels his new project an experimental music documentary film, in a remix of the celebrated film Megacities (1997), a visually refined essay on the hidden faces of several world \"megacities\" by leading Austrian documentarist Michael Glawogger.",
      "popularity": 2.259,
      "poster_path": "/x7Sz339F2oC8mBf0DHCQpKizXaL.jpg",
      "release_date": "2006-01-01",
      "revenue": 0,
      "runtime": 80,
      "title": "Life in Loops (A Megacities RMX)",
      "video": false,
      "vote_average": 7.738,
      "vote_count": 21
    }

    @data_2 = {
      "adult": false,
      "budget": 250000000,
      "genres": [
        {
            "id": 12,
            "name": "Adventure"
        },
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 878,
            "name": "Science Fiction"
        }
      ],
      "homepage": "https://www.marvel.com/movies/captain-america-civil-war",
      "id": 271110,
      "original_title": "Captain America: Civil War",
      "overview": "Following the events of Age of Ultron, the collective governments of the world pass an act designed to regulate all superhuman activity. This polarizes opinion amongst the Avengers, causing two factions to side with Iron Man or Captain America, which causes an epic battle between former allies.",
      "popularity": 118.414,
      "poster_path": "/rAGiXaUfPzY7CDEyNKUofk3Kw2e.jpg",
      "release_date": "2016-04-27",
      "revenue": 1153296293,
      "runtime": 147,
      "title": "Captain America: Civil War",
      "vote_average": 7.437,
      "vote_count": 20333
    }

    @movie_1 = MovieInfo.new(@data_1)
    @movie_2 = MovieInfo.new(@data_2)
    end
    it '#runtime_in_hours (converts the runtime to hours and minutes)' do
      expect(@movie_1.runtime_in_hours).to eq("1hr 20min")
      expect(@movie_2.runtime_in_hours).to eq("2hr 27min")
    end

    it '#genre_list (converts the genre array to a string list)' do
      expect(@movie_1.genre_list).to eq("Documentary")
      expect(@movie_2.genre_list).to eq("Adventure, Action, Science Fiction")
    end
  end
end
