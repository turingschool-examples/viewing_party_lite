require 'rails_helper'

RSpec.describe Movie do
  it "exists" do
    movie_attributes = { :genres=>
                         [{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}],
                         :id=>278,
                         :original_title=>"The Shawshank Redemption",
                         :overview=>
                          "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                         :poster_path=>"/hBcY0fE9pfXzvVaY4GKarweriG2.jpg",
                         :runtime=>142,
                         :tagline=>"Fear can hold you prisoner. Hope can set you free.",
                         :title=>"The Shawshank Redemption",
                         :vote_average=>8.7}
    cast_attributes = {
                        "id": 278,
                        "cast": [
                          {
                            "adult": false,
                            "gender": 2,
                            "id": 504,
                            "known_for_department": "Acting",
                            "name": "Tim Robbins",
                            "original_name": "Tim Robbins",
                            "popularity": 23.46,
                            "profile_path": "/hsCu1JUzQQ4pl7uFxAVFLOs9yHh.jpg",
                            "cast_id": 3,
                            "character": "Andy Dufresne",
                            "credit_id": "52fe4231c3a36847f800b131",
                            "order": 0
                          },
                          {
                            "adult": false,
                            "gender": 2,
                            "id": 192,
                            "known_for_department": "Acting",
                            "name": "Morgan Freeman",
                            "original_name": "Morgan Freeman",
                            "popularity": 54.139,
                            "profile_path": "/905k0RFzH0Kd6gx8oSxRdnr6FL.jpg",
                            "cast_id": 4,
                            "character": "Ellis Boyd 'Red' Redding",
                            "credit_id": "52fe4231c3a36847f800b135",
                            "order": 1
                          },
                          {
                            "adult": false,
                            "gender": 2,
                            "id": 4029,
                            "known_for_department": "Acting",
                            "name": "Bob Gunton",
                            "original_name": "Bob Gunton",
                            "popularity": 15.739,
                            "profile_path": "/rr2KDCKK4t0f5YhZibCpLCAsJxc.jpg",
                            "cast_id": 5,
                            "character": "Warden Norton",
                            "credit_id": "52fe4231c3a36847f800b139",
                            "order": 2
                          }
                        ]
                      }
    review_attributes = {
                          "id": 278,
                          "page": 1,
                          "results": [
                            {
                              "author": "elshaarawy",
                              "author_details": {
                                "name": "",
                                "username": "elshaarawy",
                                "rating": 9.0
                              },
                              "content": "very good movie 9.5/10 محمد الشعراوى",
                              "created_at": "2016-04-29T18:08:41.892Z",
                              "id": "5723a329c3a3682e720005db",
                              "updated_at": "2021-06-23T15:57:47.190Z",
                              "url": "https://www.themoviedb.org/review/5723a329c3a3682e720005db"
                            }
                          ],
                          "total_pages": 1,
                          "total_results": 1
                          }

    movie = Movie.new(movie_attributes, cast_attributes, review_attributes)

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.title).to eq("The Shawshank Redemption")
    expect(movie.vote_average).to eq(8.7)
    expect(movie.runtime).to eq(142)
    expect(movie.genres).to eq(["Drama", "Crime"])
    expect(movie.summary).to eq("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
    expect(movie.cast.size).to eq(3)
    expect(movie.cast).to be_a(Hash)
    expect(movie.review_count).to eq(1)
    expect(movie.reviews).to be_a(Hash)
    expect(movie.id).to eq(278)
    expect(movie.movie_poster).to eq("/hBcY0fE9pfXzvVaY4GKarweriG2.jpg")
  end
end
