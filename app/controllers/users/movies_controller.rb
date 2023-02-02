class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:query]
      @movies = MovieFacade.search_results(params[:query])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:id]) 
  end
end