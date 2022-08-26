class MoviesController < ApplicationController
  before_action :find_user, only: [:index]
  
  def index
    @movies = MovieFacade.create_top_movies
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
