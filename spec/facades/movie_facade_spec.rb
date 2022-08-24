require 'rails_helper'

RSpec.describe MovieService do
  it 'returns movie poros', :vcr do
    movies = MovieFacade.create_top_movies

    expect(movies[0]).to be_a(Movie)
    expect(movies.count).to eq(40)
    expect(movies[0].title).to eq('The Shawshank Redemption')
    expect(movies[0].vote_average).to eq(8.7)
  end
end
