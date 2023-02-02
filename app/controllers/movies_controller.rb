class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @movies = MovieFacade.top_rated
    elsif params[:search]
      @movies = MovieFacade.search(params[:search])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details(params[:id])
    @cast = MovieFacade.cast(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
  end
end
