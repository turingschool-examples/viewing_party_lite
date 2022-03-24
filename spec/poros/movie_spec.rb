require "rails_helper"

RSpec.describe Movie do
  it "exists with attributes" do
    data = {
      :id => 1,
      :title => "title",
      :vote_average => 3.5
    }

    movie = Movie.new(data)

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.id).to eq(1)
    expect(movie.title).to eq("title")
    expect(movie.vote_average).to eq(3.5)
  end
end
