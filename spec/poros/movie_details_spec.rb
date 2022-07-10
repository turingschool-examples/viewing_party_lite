require 'rails_helper'

RSpec.describe MovieDetails do

  it 'populates Movie Details fields from JSON response' do
    data = {
      id: 287,
      title: "Mountain",
      vote_average: 9.7,
      genres: [{ name: "fortune" }],
      runtime: 120,
      overview: "A ghost of the past",
      credits: {cast:[1,2,3,4,5,6,7,8,9,10]},
      reviews: {total_results: 15, results: [{author_details: {name: "Jimmy"}}]}
    }

    movie_details = MovieDetails.new(data)

    expect(movie_details).to be_a MovieDetails
    expect(movie_details.title).to eq("Mountain")
    expect(movie_details.vote_average).to eq(9.7)
    expect(movie_details.genre).to eq(["fortune"])
    expect(movie_details.runtime).to eq(120)
    expect(movie_details.summary).to eq("A ghost of the past")
    expect(movie_details.cast_members).to eq([1,2,3,4,5,6,7,8,9,10])
    expect(movie_details.total_reviews).to eq(15)
    expect(movie_details.author).to eq([{name: "Jimmy"}])
  end
end
