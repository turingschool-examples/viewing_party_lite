class MoviesController < ApplicationController
  def index
    @user = params[:user_id]
    if params[:commit] == 'Search by Movie Title'
      @movies = MoviesFascade.movie_data(params[:search])
      @title = params[:commit]
    end

    if params[:commit] == 'Discover Top Rated Movies'
      @movies = MoviesFascade.top_rated
      @title = params[:commit]
    end
  end

  def show
    @user = params[:user_id]

    @movie = MoviesFascade.find(params[:id])
  end
end
