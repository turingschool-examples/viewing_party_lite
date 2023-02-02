class MoviesController < ApplicationController
  def index
    if params[:commit] == 'Search by Movie Title'
      @movies = MoviesFascade.movie_data(params[:search])
      @title = params[:commit]
    end

    if params[:commit] == 'Discover Top Rated Movies'
      @movies = MoviesFascade.top_rated
      @title = params[:commit]
    end
  end
end