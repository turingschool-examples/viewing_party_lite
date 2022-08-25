require 'rails_helper'

RSpec.describe Movie do
  it 'initializes with a hash of data' do
    data = {
      id: 1,
      title: 'The Shawshank Redemption',
      vote_average: 9.3,
      overview: "Overview here",
      runtime: 120,
      genres: [
        {
          name: "drama"
        },
        {
          name: "thriller"
        }
      ]
    }
    cast = {
      cast: [
          {
          name: "a",
          character: "a"
        },
          {
          name: "b",
          character: "b"
        },
          {
          name: "c",
          character: "c"
        },
          {
          name: "d",
          character: "d"
        },
          {
          name: "e",
          character: "e"
        },
          {
          name: "f",
          character: "f"
        },
          {
          name: "g",
          character: "g"
        },
          {
          name: "h",
          character: "h"
        },
          {
          name: "i",
          character: "i"
        },
          {
          name: "j",
          character: "j"
        }
      ]
    }
    review = {
      total_results: 3,
      results: [
        {
            author_details: {
              username: "user1"
            },
            content: "review 1"
        },
        {
            author_details: {
              username: "user2"
            },
            content: "review 2"
        },
        {
            author_details: {
              username: "user3"
            },
            content: "review 3"
        }
      ]
    }
    movie = Movie.new(data, cast, review)

    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(1)
    expect(movie.title).to eq('The Shawshank Redemption')
    expect(movie.vote_average).to eq(9.3)
    expect(movie.summary).to eq("Overview here")
    expect(movie.runtime).to eq("2h 0min")
    expect(movie.genre).to eq(["drama,", "thriller"])

    expect(movie.cast).to include("a as a")
    expect(movie.cast).to include("b as b")

    expect(movie.review_count).to eq(3)
  end
end
