require 'rails_helper'

RSpec.describe MovieDetails do
  it 'exists' do 
    attrs = {
      poster_path: "/sdf/asdf.jpg",
      title: "Space Princess", 
      runtime: 250, 
      genres: [{name: "SciFi"}, {name: "Horror"}],
      vote_average: 10.0,
      overview: "This is a great film",
      id: 1,
    }

    details = MovieDetails.new(attrs)

    expect(details).to be_a MovieDetails
    expect(details.id).to eq(1)
    expect(details.title).to eq("Space Princess")
    expect(details.vote).to eq(10.0)
    expect(details.genres).to eq(["SciFi", "Horror"])
    expect(details.runtime).to eq(250)
    expect(details.summary).to eq("This is a great film")
    expect(details.partial_image_path).to eq("/sdf/asdf.jpg")
  end
end