class MoviesController < ApplicationController

  def new
    @user = User.find(params[:id])
  end

  def index
    @movies = MovieFacade.find_popular_movies
  end

  def show
    # movie_id = 58089 #params[:movie_id]
    # @movie_data = MovieFacade.get_movie_details(params[:movie_id])
    @movie = MovieFacade.get_movie_details(params[:id])

  end
end
