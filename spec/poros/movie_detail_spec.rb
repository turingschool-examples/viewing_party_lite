require "rails_helper"

RSpec.describe MovieDetail do
  it "exists with attributes" do
    data = {
      :id => 1,
      :title => "title",
      :vote_average => 3.5,
      :runtime => 90,
      :genres => 'comedy',
      :overview => 'A great journey',
      :poster_path => '/qpRtxbnLb0qFP93db5vwDDXvWz2.jpg'
    }

    single_movie = MovieDetail.new(data)

    expect(single_movie).to be_an_instance_of(MovieDetail)
    expect(single_movie.id).to eq(1)
    expect(single_movie.title).to eq("title")
    expect(single_movie.vote_average).to eq(3.5)
    expect(single_movie.runtime).to eq(90)
    expect(single_movie.genre).to eq('comedy')
    expect(single_movie.summary).to eq('A great journey')
    expect(single_movie.poster).to eq('/qpRtxbnLb0qFP93db5vwDDXvWz2.jpg')
  end
end
