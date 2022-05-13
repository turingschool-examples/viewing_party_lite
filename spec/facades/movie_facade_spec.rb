require 'rails_helper'

RSpec.describe MovieFacade do 
  it 'can return top rated movies' do
    movies = MovieFacade.top_rated
    expect(movies).to be_a(Array)
    expect(movies).to be_all Movie
  end

  it 'can return movies matching a search keyword' do
    movies = MovieFacade.search_for_movies("Jaws")
    expect(movies).to be_a(Array)
    expect(movies).to be_all Movie
    expect(movies.first.title).to eq("Jaws")
  end 

  it 'can return a movie when given an id' do
    movie = MovieFacade.movie_id(1381)
    expect(movie).to be_a Movie 
    expect(movie.title).to eq("The Fountain")
  end 

  it 'can return multiple movies when given multiple ids' do
    movies = MovieFacade.multiple_movies([1381, 578])
    expect(movies).to be_a(Array)
    expect(movies).to be_all Movie
    expect(movies.first.title).to eq("The Fountain")
    expect(movies.last.title).to eq("Jaws")

  end 

end 