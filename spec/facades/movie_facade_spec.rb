require 'rails_helper'

RSpec.describe MovieFacade do 
  let!(:top_rated) { MovieFacade.top_movies }
  let!(:search_movies) { MovieService.find_movies("Doctor Strange") }

  it 'creates top rated movie poros', :vcr do
     expect(top_rated.first).to be_a(Movie)
  end 

  it 'creates searched movies', :vcr do 
    expect(search_movies.first[:id]).to eq(453395)
  end
end