class MoviesController < ApplicationController
  # before_action :current_user

  def index
    @user = current_user
  end

  def results
    @user = current_user
    if params[:q] == "top rated"
      @movies = MovieFacade.top_rated
    elsif params[:search]
      @movies = MovieFacade.search_by_title(params[:search])
    end
  end

  def show
    @user = current_user
    @movie = MovieFacade.find_movie(params[:id])
  end

  def current_user
    User.find(session[:user_id])
  end
end
