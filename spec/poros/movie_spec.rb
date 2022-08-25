require 'rails_helper'

RSpec.describe Movie do 
  it "exists and attributes" do 
    response = JSON.parse(File.read('spec/fixtures/top_rated.json'), symbolize_names: true)[:results][1]
    movie = Movie.new(response)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("Dilwale Dulhania Le Jayenge")
    expect(movie.vote_average).to eq(8.7)
  end
end