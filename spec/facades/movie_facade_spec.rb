require 'rails_helper'

RSpec.describe 'Movie Facade' do
  it 'creates top rated movies', :vcr do
    top_rated_movies = MovieFacade.create_top_rated

    expect(top_rated_movies[0]).to be_an_instance_of(Movie)
  end

  it 'creates movies from search', :vcr do
    movies = MovieFacade.create_searched('Avatar')

    expect(movies[0]).to be_an_instance_of(Movie)
  end
end
