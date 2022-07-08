require 'rails_helper'

RSpec.describe MovieReview do
  it 'is able to capture and call reviews for a movie' do
    data = {
            "author": "elshaarawy",
            "author_details": {
                "name": "",
                "username": "elshaarawy",
                "avatar_path": nil,
                "rating": 9.0
            },
            "content": "very good movie 9.5/10 محمد الشعراوى",
            "created_at": "2016-04-29T18:08:41.892Z",
            "id": "5723a329c3a3682e720005db",
            "updated_at": "2021-06-23T15:57:47.190Z",
            "url": "https://www.themoviedb.org/review/5723a329c3a3682e720005db"
        }
    movie_review = MovieReview.new(data)

    expect(movie_review).to be_a(MovieReview)
    expect(movie_review.name).to eq("elshaarawy")
    expect(movie_review.rating).to eq(9.0)
    expect(movie_review.review).to eq("very good movie 9.5/10 محمد الشعراوى")
  end
end
