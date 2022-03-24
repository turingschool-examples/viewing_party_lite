require "rails_helper"

RSpec.describe Movies do
  it "exists with attributes" do
    data = {
      :id => 1,
      :title => "title",
      :vote_average => 3.5
    }

    movie = Movies.new(data)

    expect(movie).to be_an_instance_of(Movies)

    expect(movie.id).to be_an_instance_of(Integer)
    expect(movie.id).to eq(1)

    expect(movie.title).to be_an_instance_of(String)
    expect(movie.title).to eq("title")

    expect(movie.vote_average).to be_an_instance_of(Float)
    expect(movie.vote_average).to eq(3.5)
  end
end
