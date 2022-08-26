# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists and has proper  movie attributes' do
    data = {
      "adult": false,
      "backdrop_path": '/htuuuEwAvDVECMpb0ltLLyZyDDt.jpg',
      "belongs_to_collection": {
        "id": 230,
        "name": 'The Godfather Collection',
        "poster_path": '/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg',
        "backdrop_path": '/3WZTxpgscsmoUk81TuECXdFOD0R.jpg'
      },
      "budget": 6_000_000,
      "genres": [
        {
          "id": 18,
          "name": 'Drama'
        },
        {
          "id": 80,
          "name": 'Crime'
        }
      ],
      "homepage": 'http://www.thegodfather.com/',
      "id": 238,
      "imdb_id": 'tt0068646',
      "original_language": 'en',
      "original_title": 'The Godfather',
      "overview": 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.',
      "popularity": 87.908,
      "poster_path": '/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
      "production_companies": [
        {
          "id": 4,
          "logo_path": '/gz66EfNoYPqHTYI4q9UEN4CbHRc.png',
          "name": 'Paramount',
          "origin_country": 'US'
        },
        {
          "id": 10_211,
          "logo_path": nil,
          "name": 'Alfran Productions',
          "origin_country": 'US'
        }
      ],
      "production_countries": [
        {
          "iso_3166_1": 'US',
          "name": 'United States of America'
        }
      ],
      "release_date": '1972-03-14',
      "revenue": 245_066_411,
      "runtime": 175,
      "spoken_languages": [
        {
          "english_name": 'English',
          "iso_639_1": 'en',
          "name": 'English'
        },
        {
          "english_name": 'Italian',
          "iso_639_1": 'it',
          "name": 'Italiano'
        },
        {
          "english_name": 'Latin',
          "iso_639_1": 'la',
          "name": 'Latin'
        }
      ],
      "status": 'Released',
      "tagline": "An offer you can't refuse.",
      "title": 'The Godfather',
      "video": false,
      "vote_average": 8.7,
      "vote_count": 16_416,

      "cast": [
        {
          "adult": false,
          "gender": 2,
          "id": 3084,
          "known_for_department": 'Acting',
          "name": 'Marlon Brando',
          "original_name": 'Marlon Brando',
          "popularity": 16.087,
          "profile_path": '/5o8whyfLBWXLODEcMP8K45lPTjT.jpg',
          "cast_id": 5,
          "character": 'Don Vito Corleone',
          "credit_id": '52fe422bc3a36847f8009357',
          "order": 0
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1158,
          "known_for_department": 'Acting',
          "name": 'Al Pacino',
          "original_name": 'Al Pacino',
          "popularity": 82.128,
          "profile_path": '/fMDFeVf0pjopTJbyRSLFwNDm8Wr.jpg',
          "cast_id": 6,
          "character": 'Don Michael Corleone',
          "credit_id": '52fe422bc3a36847f800935b',
          "order": 1
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3085,
          "known_for_department": 'Acting',
          "name": 'James Caan',
          "original_name": 'James Caan',
          "popularity": 30.115,
          "profile_path": '/bGyOCCOIgcIyKjOGLoXoyp0XWHf.jpg',
          "cast_id": 7,
          "character": "Santino 'Sonny' Corleone",
          "credit_id": '52fe422bc3a36847f800935f',
          "order": 2
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3087,
          "known_for_department": 'Acting',
          "name": 'Robert Duvall',
          "original_name": 'Robert Duvall',
          "popularity": 33.451,
          "profile_path": '/ybMmK25h4IVtfE7qrnlVp47RQlh.jpg',
          "cast_id": 9,
          "character": 'Tom Hagen',
          "credit_id": '52fe422bc3a36847f8009367',
          "order": 3
        },
        {
          "adult": false,
          "gender": 0,
          "id": 3086,
          "known_for_department": 'Acting',
          "name": 'Richard S. Castellano',
          "original_name": 'Richard S. Castellano',
          "popularity": 10.691,
          "profile_path": '/1vr75BdHWret81vuSJ3ugiCBkxw.jpg',
          "cast_id": 8,
          "character": 'Pete Clemenza',
          "credit_id": '52fe422bc3a36847f8009363',
          "order": 4
        },
        {
          "adult": false,
          "gender": 1,
          "id": 3092,
          "known_for_department": 'Acting',
          "name": 'Diane Keaton',
          "original_name": 'Diane Keaton',
          "popularity": 18.615,
          "profile_path": '/9WfaYj5iBMyDX4IJyM1bdMRD3x6.jpg',
          "cast_id": 13,
          "character": 'Kay Adams',
          "credit_id": '52fe422bc3a36847f8009377',
          "order": 5
        },
        {
          "adult": false,
          "gender": 1,
          "id": 3094,
          "known_for_department": 'Acting',
          "name": 'Talia Shire',
          "original_name": 'Talia Shire',
          "popularity": 18.621,
          "profile_path": '/due9MtmbvCMDd1aNveuMyjsaZ8W.jpg',
          "cast_id": 15,
          "character": "Constanzia 'Connie' Corleone-Rizzi",
          "credit_id": '52fe422bc3a36847f800937f',
          "order": 6
        }
      ],
      "results": [
        {
          "author": 'futuretv',
          "author_details": {
            "name": '',
            "username": 'futuretv',
            "avatar_path": '/https://www.gravatar.com/avatar/f44259356bf6110070ed799323d539d6.jpg',
            "rating": 10.0
          },
          "content": "The Godfather Review by Al Carlson\r\n\r\nThe Godfather is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best. As a film that ranks as high as other masterpieces including Citizen Kane, Pulp Fiction and 12 Angry Men, The Godfather is an exceptional piece of cinema excellence that is flawless and is simply the pinnacle crime drama.\r\nThe Godfather revolves around the Corleone's, an Italian family with deep roots in the New York City mafia. The head of the Corleone's is Don Vito Corleone, a man who takes care of his family and demands respect in return. His son Michael however, who just returned home from World War II, doesn't want to become involved with the family business. The Sollozzo's, a family of drug dealers, confront Don and request protection in exchange for profits from the Sollozzo's drug sales. But Don declines the offer, for he is against selling narcotics. The rejected offer starts what turns into an all out mafia war between the two families with Michael diving deep into the mafia lifestyle.\r\nThe characters are portrayed by a legendary all-star cast including Marlon Brando as Don, Al Pacino as his son Michael and James Caan as Don's oldest son Sonny. The casting for this film has been considered by many to be the best casted film in history for their astonishing performances. All three main actors were nominated for an academy award, but only Marlon Brando won an Oscar for best actor in a leading role. It's fascinating to watch how these characters change over the course of the movie, with one in particular changing drastically.\r\nDirecter Francis Ford Coppola, being raised in an Italian-American family in New York, understood Italian culture exceptionally and made the film very authentically. Everything from the wedding dances to the cuisine to the terms used by the characters in Sicilian come from Coppola's first-hand knowledge of Italian-American culture. Italian composer Nino Rota did an outstanding job making the soundtrack for the film, despite not getting the Oscar for best music (but he did win an Oscar for his work in the sequel, The Godfather: Part II). Virtually everyone recognizes that iconic trumpet solo once it starts playing. He also wrote the score for another great Italian film 8 1/2. \r\nThis film should be immediately followed up by it's sequel, The Godfather: Part II, which also won best picture. The series still holds the title of most best picture awards for a film series to this day. They're both flawless crime dramas and have earned their titles as some of the best pieces of cinema ever. I will guarantee you won't be able to see this film only once, as it gets better after continual viewings. There is really nothing more to add other than if you haven't seen this movie yet, it's about time you did. The Godfather is a movie you can't refuse.",
          "created_at": '2014-04-10T20:09:40.500Z',
          "id": '5346fa840e0a265ffa001e20',
          "updated_at": '2021-06-23T15:57:25.895Z',
          "url": 'https://www.themoviedb.org/review/5346fa840e0a265ffa001e20'
        },
        {
          "author": 'crastana',
          "author_details": {
            "name": '',
            "username": 'crastana',
            "avatar_path": '/https://www.gravatar.com/avatar/87b1f10dd7dae245ac84657537983336.jpg',
            "rating": 10.0
          },
          "content": "The best movie ever...\r\nA masterpiece by the young and talented Francis Ford Coppola, about a Mob family and their drama, the story telling is perfect, the acting good, sometimes a little over the top in the case of Thalia Shire (the sister of the director)\r\n\r\nThe 70's were the best years for Hollywood.",
          "created_at": '2022-07-18T23:18:07.748Z',
          "id": '62d5ea2fe93e95095cbddefe',
          "updated_at": '2022-07-26T14:21:07.910Z',
          "url": 'https://www.themoviedb.org/review/62d5ea2fe93e95095cbddefe'
        }
      ]
    }
    godfather = Movie.new(data)
    expect(godfather).to be_a Movie
    expect(godfather.title).to eq(data[:title])
    expect(godfather.duration).to eq(data[:runtime])
    expect(godfather.cast).to eq(data[:cast])
    expect(godfather.movie_image).to eq(data[:poster_path])
    expect(godfather.vote_average).to eq(data[:vote_average])
    expect(godfather.genres).to eq(data[:genres])
    expect(godfather.overview).to eq(data[:overview])
    expect(godfather.release_date).to eq(data[:release_date])
    expect(godfather.reviews).to eq(data[:results])
  end
end
