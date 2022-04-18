class UsersMoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated].present?
      @top_movies = MovieFacade.top_movies
      render 'users/movies/index'
    end
  end

  def create
    @user = User.find(params[:user_id])
    if params[:search].present?
      @search_movie = MovieFacade.search(params[:search])
      render 'users/movies/index'
    end
  end
end
