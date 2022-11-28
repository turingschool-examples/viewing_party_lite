require 'rails_helper'

RSpec.describe MovieFacade do
  it 'returns movie poros', :vcr do
    movies = MovieFacade.create_top_movies

    expect(movies[0]).to be_a(Movie)
    expect(movies.count).to eq(40)
    expect(movies[0].title).to eq('The Godfather')
    expect(movies[0].vote_average).to eq(8.7)
  end

  it 'returns data for the movie search', :vcr do
    search = "Dune"
    result = MovieFacade.create_search_movie(search)

    expect(result[0]).to be_a(Movie)
    expect(result.count).to eq(40)
    expect(result[0].title).to eq('Dune')
    expect(result[0].vote_average).to eq(7.9)
  end
end
