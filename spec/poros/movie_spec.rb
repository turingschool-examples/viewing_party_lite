require 'rails_helper'

RSpec.describe Movie do

  it "is able to see that it has movie data" do
    data1 = {
    "adult": false,
    "budget": 50000000,
    "genres": [
        {
            "id": 35,
            "name": "Comedy"
        },
        {
            "id": 10751,
            "name": "Family"
        },
        {
            "id": 16,
            "name": "Animation"
        }
    ],
    "homepage": "https://www.tomandjerrymovie.com",
    "id": 587807,
    "imdb_id": "tt1361336",
    "original_language": "en",
    "original_title": "Tom & Jerry",
    "overview": "Tom the cat and Jerry the mouse get kicked out of their home and relocate to a fancy New York hotel, where a scrappy employee named Kayla will lose her job if she can’t evict Jerry before a high-class wedding at the hotel. Her solution? Hiring Tom to get rid of the pesky mouse.",
    "popularity": 145.478,
    "poster_path": "/8XZI9QZ7Pm3fVkigWJPbrXCMzjq.jpg",
    "production_companies": [
        {
            "id": 174,
            "logo_path": "/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png",
            "name": "Warner Bros. Pictures",
            "origin_country": "US"
        },
        {
            "id": 8922,
            "logo_path": "/yZWehAyjfKi4KvKeg1bkJ1bm5H8.png",
            "name": "Turner Entertainment",
            "origin_country": "US"
        },
        {
            "id": 25120,
            "logo_path": "/lqUpBvDLQYG3QaKNpe2lxfpgh36.png",
            "name": "Warner Animation Group",
            "origin_country": "US"
        },
        {
            "id": 77061,
            "logo_path": nil,
            "name": "The Story Company",
            "origin_country": ""
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2021-02-10",
    "revenue": 132000000,
    "runtime": 101,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "Best of enemies. Worst of friends.",
    "title": "Tom & Jerry",
    "video": false,
    "vote_average": 6.977,
    "vote_count": 2068
}

    data_2 = {
            "adult": false,
            "gender": 1,
            "id": 56734,
            "known_for_department": "Acting",
            "name": "Chloë Grace Moretz",
            "original_name": "Chloë Grace Moretz",
            "popularity": 73.164,
            "profile_path": "/uIlu8tHJahd605Tknh9XbTbuptR.jpg",
            "cast_id": 5,
            "character": "Kayla Forrester",
            "credit_id": "5cc46f789251417d390329d3",
            "order": 0
        },
        {
            "adult": false,
            "gender": 2,
            "id": 454,
            "known_for_department": "Acting",
            "name": "Michael Peña",
            "original_name": "Michael Peña",
            "popularity": 24.968,
            "profile_path": "/tu5CtDtVP4oZBVQgi0s4vgZErIg.jpg",
            "cast_id": 6,
            "character": "Terence Mendoza",
            "credit_id": "5ce4614a9251414902b9ccc8",
            "order": 1
        }

  data_3 = [
        {
            "author": "Louisa Moore - Screen Zealots",
            "author_details": {
                "name": "Louisa Moore - Screen Zealots",
                "username": "screenzealots",
                "avatar_path": "/https://www.gravatar.com/avatar/70d4177132896d293b72f4c595521141.jpg",
                "rating": 4.0
            },
            "content": "One of the best things I can say about the “Tom and Jerry” feature movie, now streaming on HBO Max, is that it isn’t wholly terrible. The animation is bright, the human cast delivers enjoyably goofy performances, and the film stays true to the original cartoon’s roots. It isn’t super funny nor creative, but the fun story about a celebrity wedding gone awry and a stuffy New York City hotel that employs a cat to rid them of a mouse problem lays the groundwork for a bit of amusing mayhem.\r\n\r\nBlending classic animation with live action, the effects are better than expected. The actors (including Chloë Grace Moretz, Michael Peña, Pallavi Sharda, and Colin Jost) do a great job interacting with their cat and mouse counterparts, and the cartoonish elements are reminiscent of the classic Tom and Jerry of the past. The story rekindles the rivalry between the two, but is updated for modern audiences.\r\n\r\nThe physical comedy and sight gags are good for most of the giggles, but that’s where the humor stops. There’s also a lot of unnecessary potty humor and a few questionable plot points (the movie does little to rise above certain stereotypes) that may feel cringe-worthy to some adults.\r\n\r\n“Tom and Jerry” isn’t noteworthy at all, but it’s not awful, either. There’s enough here to entertain most kids for a couple of hours.",
            "created_at": "2021-03-09T15:42:27.392Z",
            "id": "60479763c4ad590044e8dc85",
            "updated_at": "2021-06-23T15:58:53.004Z",
            "url": "https://www.themoviedb.org/review/60479763c4ad590044e8dc85"
        },
        {
            "author": "SWITCH.",
            "author_details": {
                "name": "SWITCH.",
                "username": "maketheSWITCH",
                "avatar_path": "/klZ9hebmc8biG1RC4WmzNFnciJN.jpg",
                "rating": 4.0
            },
            "content": "The spirit of the old cartoons is nowhere to be seen here, and that's the biggest disappointment. There is certainly enough here to entertain families - albeit probably not the parents - and I can envision this film playing on repeat for certain kids. Alas, for anyone looking to recapture the magic of the cartoons and revisiting some old favourites, it's best to look elsewhere.\r\n- Joel Kalkopf\r\n\r\nRead Joel's full article...\r\nhttps://www.maketheswitch.com.au/article/review-tom-and-jerry-a-spiritless-reimagining-of-a-classic-cartoon",
            "created_at": "2021-04-02T00:24:26.724Z",
            "id": "6066643a63d713002921bf43",
            "updated_at": "2021-06-23T15:58:53.861Z",
            "url": "https://www.themoviedb.org/review/6066643a63d713002921bf43"
        }
    ]
    movie = Movie.new(data1, data_2, data_3)

    expect(movie).to be_a Movie
    expect(movie.title).to eq(data1[:original_title])
    expect(movie.vote_average).to eq(data1[:vote_average])
    expect(movie.runtime).to eq(data1[:runtime])
    expect(movie.genres).to be_a Array
    expect(movie.overview).to eq(data1[:overview])
    expect(movie.cast).to be_a Array
    expect(movie.review_count). to eq(2)
    expect(movie.reviews).to be_a Array
  end
end
