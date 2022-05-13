require 'rails_helper'

RSpec.describe 'MovieFacade' do
  it 'can return an array of movie objects', :vcr do
    movie_list = MovieFacade.movie_list('top_rated')
    one_movie = MovieFacade.movie_list('castaway')

    expect(movie_list).to be_a(Array)
    expect(one_movie).to be_a(Array)
    expect(movie_list).to be_all(Movie)
  end
end