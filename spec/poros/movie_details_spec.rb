require 'rails_helper'

RSpec.describe MovieDetails do
  before(:each) do
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
    @movie = MovieDetails.new(data, cast, review)
  end

  it "creates an instance of MovieDetails" do
    expect(@movie).to be_a(MovieDetails)
  end

  it "parses out the genre information and formats it for the view" do
    expect(@movie.genre).to eq(["drama,", "thriller"])
  end

  it "parses out runtime data and formats it for the view" do
    expect(@movie.runtime).to eq("2h 0min")
  end

  it "parses out cast data and formats it for the view" do
    expect(@movie.cast).to include("a as a")
    expect(@movie.cast).to include("b as b")
  end

  it "parses out review data and formats it for the view" do
    expect(@movie.review_count).to eq(3)
    expect(@movie.reviews[0][:author]).to eq("user1")
    expect(@movie.reviews[0][:review]).to eq("review 1")
  end
end
