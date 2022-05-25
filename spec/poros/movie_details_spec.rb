require 'rails_helper'

RSpec.describe MovieDetails do
  let!(:data){
              {
                id: 123,
                title: "Movie Title",
                vote_average: 8.9,
                runtime: 144,
                genres: [{name: "Drama"}],
                overview: "Example summary",
                credits: {cast: [1,2,3,4,5,6,7,8,9]},
                reviews: {total_results: 8, results: [{author_details: "Details"}]},
                poster_path: "some_url"
              }
            }

  let!(:movie) {MovieDetails.new(data)}
  it 'exists' do
    expect(movie).to be_a(MovieDetails)
  end

  it 'has data' do
    expect(movie.id).to eq(123)
    expect(movie.title).to eq("Movie Title")
    expect(movie.vote_average).to eq(8.9)
    expect(movie.runtime).to eq(144)
    expect(movie.genres).to eq(["Drama"])
    expect(movie.summary).to eq("Example summary")
    expect(movie.cast).to eq([1,2,3,4,5,6,7,8,9])
    expect(movie.count_of_reviews).to eq(8)
    expect(movie.review_author_details).to eq(["Details"])
    expect(movie.poster).to eq("some_url")
  end

end
