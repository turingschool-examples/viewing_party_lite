require 'rails_helper'

RSpec.describe Movie do 

  it 'exists' do
    data = {
      id: 178, 
      title: "Jaws", 
      vote_average: 8.8,
      runtime: 124,
      original_title: "Jaws",
      poster_path: "/fakepath/morefake/notreal/123"
      }
    
    movie = Movie.new(data)
    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(178)
    expect(movie.title).to eq("Jaws")
    expect(movie.vote_average).to eq(8.8)
    expect(movie.runtime).to eq(124)
    expect(movie.original_title).to eq("Jaws")
    expect(movie.poster_path).to eq("/fakepath/morefake/notreal/123")

  end 

end 