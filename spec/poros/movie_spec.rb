require 'rails_helper'

RSpec.describe Movie do
  it "exists and has attributes" do
    response = JSON.parse(File.read('spec/fixtures/movie_response.json'), symbolize_names: true)[:results][0]
    movie = Movie.new(response)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq('The Shawshank Redemption')
    expect(movie.vote_average).to eq(8.7)
  end
end
