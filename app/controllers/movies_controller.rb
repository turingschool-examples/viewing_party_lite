class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @movies = MovieFacade.top_rated
    elsif params[:search]
      @movies = MovieFacade.movie_search
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_by_id(params[:id])
  end
end
