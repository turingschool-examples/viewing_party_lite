require 'rails_helper'

RSpec.describe Movie do 

  it 'exists' do
    data = {id: 178, title: "Jaws", vote_average: 8.8}
    movie = Movie.new(data)
    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(178)
    expect(movie.title).to eq("Jaws")
    expect(movie.vote_average).to eq(8.8)

  end 

end 