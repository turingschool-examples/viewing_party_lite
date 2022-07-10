class MoviesController < ApplicationController
  def index
    if params[:q] == "toprated"
      @movies = MoviesFacade.top_movies
    elsif params[:q] != nil
      @movies = MoviesFacade.search(params[:q])
    end
    @user = User.find(params[:user_id])
  end

  def show
    info = MoviesFacade.info(params[:id])
    @movie = Movie.new(info)
    @user = User.find(params[:user_id])
  end
end
