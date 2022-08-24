class UsersMoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:movie].present?
      movie = params[:movie]
      @movies = MovieFacade.get_a_movie(movie)
    else
      @movies = MovieFacade.find_top_40_movies
    end
  end

  def show
    @movie = MovieFacade.find_movie_details(params[:movie_id])
  end


end