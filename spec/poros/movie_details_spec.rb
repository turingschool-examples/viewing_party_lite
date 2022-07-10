require 'rails_helper'

RSpec.describe MovieDetails do
  it 'exists with attributes' do
    scarface = MovieDetails.new({title: "Scarface", vote_average: 8.2, id: 465, runtime: 108, genres: [{id: 18, name: "Drama" }, {id: 80, name: "Crime"}], overview: "After getting a green card in exchange for assassinating a Cuban government official, Tony Montana (Al Pacino) stakes a claim on the drug trade in Miami.", poster_path: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"})
    expect(scarface).to be_an_instance_of(MovieDetails)
    expect(scarface.title).to eq("Scarface")
    expect(scarface.vote_average).to eq(8.2)
    expect(scarface.id).to eq(465)
    expect(scarface.runtime).to eq(108)
    expect(scarface.genre).to eq(["Drama", "Crime"])
    expect(scarface.overview).to eq("After getting a green card in exchange for assassinating a Cuban government official, Tony Montana (Al Pacino) stakes a claim on the drug trade in Miami.")
    expect(scarface.img_path).to eq("/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
  end
end
