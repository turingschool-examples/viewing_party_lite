class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def results
    require "pry"; binding.pry
    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @movies = MovieFacade.top_rated
    elsif params[:search]
      @movies = MovieFacade.search_by_title(params[:search])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:id])
  end
end
