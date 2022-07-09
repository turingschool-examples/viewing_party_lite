require 'rails_helper'

RSpec.describe 'MovieFacade' do

  it 'makes services call and returns an array of movie objects', :vcr do
    movies = MovieFacade.new.return_top_40_movies

    expect(movies).to be_a Array
    expect(movies).to be_all Movie
  end

  it "makes services call and returns movie objects", :vcr do
    query = "shawshank"
    movies = MovieFacade.new.search_movie(query)

    expect(movies).to be_a Array
    expect(movies).to be_all Movie
  end
end
