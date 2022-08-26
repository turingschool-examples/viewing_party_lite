class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    # @movie = Movie.include?(params[:id])
    # @user = User.find(params[:user_id])
    # @movie = Movie.find {|movie| movie.id = params[:id]}
  end

  def search
    @movie = MovieFacade.create_search_movie(params[:search])
    @user = User.find(params[:id])
    render "movies/search"
  end
end
