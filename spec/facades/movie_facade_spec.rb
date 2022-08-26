require 'rails_helper' 

RSpec.describe 'MovieFacade' do
  it 'returns an array of Movies based on their ids', :vcr do 
    movies = MovieFacade.movies([244786, 278, 238])
    expect(movies).to be_a Array 
    expect(movies).to be_all Movie 
  end

  it 'returns a Movie based on its id', :vcr do 
    movie = MovieFacade.movie_detail(244786)
    expect(movie).to be_a Movie 
  end

  it 'returns an array of top Movies', :vcr do 
    movies = MovieFacade.get_top_rated
    expect(movies).to be_a Array 
    expect(movies).to be_all MovieResult
  end

  it 'returns an array of Movies matching the search', :vcr do 
    movies = MovieFacade.search("days of summer")
    expect(movies).to be_a Array 
    expect(movies).to be_all MovieResult
  end
end