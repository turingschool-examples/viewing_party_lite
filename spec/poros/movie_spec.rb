require 'rails_helper'

RSpec.describe Movie do 
  let!(:movie) { MovieFacade.top_movies.first }

  it 'has attributes', :vcr do 
    expect(movie.id).to eq(453395)
    expect(movie.title).to eq("Doctor Strange in the Multiverse of Madness")
    expect(movie.vote_average).to eq(7.5)
  end
end