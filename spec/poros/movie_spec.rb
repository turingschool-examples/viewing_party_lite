require 'rails_helper'

RSpec.describe Movie do
  let!(:data){
              {
               title: "Movie Title",
               vote_average: 8.1,
               id: 123
              }
             }
  let!(:movie) { Movie.new(data) }

  it 'exists' do
    expect(movie).to be_a(Movie)
  end

  it 'has data' do
    expect(movie.title).to eq("Movie Title")
    expect(movie.vote_average).to eq(8.1)
    expect(movie.id).to eq(123)
  end
end
