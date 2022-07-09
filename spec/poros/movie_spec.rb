require 'rails_helper'

RSpec.describe Movie do
  it "exists and has attributes" do
    data = {
      id: 9999999,
      title: "Super Real Movie",
      vote_average: 8.0,
      runtime: 137,
      original_title: "The Realest Movie to Ever Exist",
      vote_count: 1,
      overview: "Seriously, this movie exists and has attributes."
    }
    movie = Movie.new(data)

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.id).to eq(9999999)
    expect(movie.title).to eq("Super Real Movie")
    expect(movie.vote_average).to eq(8.0)
    expect(movie.runtime).to eq(137)
    expect(movie.original_title).to eq("The Realest Movie to Ever Exist")
    expect(movie.vote_count).to eq(1)
    expect(movie.overview).to eq("Seriously, this movie exists and has attributes.")
  end

  it "test attributes from different pulls" do
    data = {
      genres: [18],
      cast: [{name: "Tim Robbins"}],
    }
    movie = Movie.new(data)

    expect(movie.genres).to eq [18]
    expect(movie.cast.length).to eq 1
  end

  it "formats runtime into hour/minute" do
    data = {runtime: 134}
    movie = Movie.new(data)

    expect(movie.format_runtime(movie.runtime)). to eq "2:14"
  end

  it "formats genres into a list" do
    data = { genres: [{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}]}
    movie = Movie.new(data)

    expect(movie.format_genres(movie.genres)).to eq ["Drama", "Crime"]
  end
end
