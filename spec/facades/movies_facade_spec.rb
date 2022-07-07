require 'rails_helper'

RSpec.describe 'MoviesFacade', :vcr do
  it 'makes services call and returns an array of movie objects' do
    movies = MovieFacade.create_top_movies

    expect(movies).to be_a(Array)
    expect(movies).to be_all(Movie)
  end

  it 'makes services call and returns an array of movie objects based on search' do
    string = 'Pirates'
    movies = MovieFacade.create_movie_search(string)

    expect(movies).to be_a(Array)
    expect(movies).to be_all(Movie)
  end
end
