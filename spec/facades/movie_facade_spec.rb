require 'rails_helper'

RSpec.describe MovieFacade do
  let!(:top_rated) { MovieFacade.top_movies }
  let!(:search_movies) { MovieService.find_movies("Doctor Strange") }
  let!(:search_id) { MovieFacade.search_by_id(453395) }
  let!(:movie_cast) { MovieFacade.movie_cast(453395) }
  let!(:movie_reviews) { MovieFacade.movie_reviews(453395) }

  it 'creates top rated movie poros', :vcr do
     expect(top_rated.first).to be_a(Movie)
  end

  it 'creates searched movies', :vcr do
    expect(search_movies.first[:id]).to eq(453395)
  end

  it 'creates search_id', :vcr do
    expect(search_id.title).to eq("Doctor Strange in the Multiverse of Madness")
  end

  it 'creates movie cast', :vcr do
    expect(movie_cast[0][:name]).to eq("Benedict Cumberbatch")
  end

  it 'creates the movie reviews', :vcr do
    expect(movie_reviews[0][:author]).to eq("Chris Sawin")
    expect(movie_reviews[1][:author]).to eq("MSB")
  end
end