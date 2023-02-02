class Users::MoviesController < ApplicationController
  
  def index
    @top_movies = movie_service.get_top_movies
  end

  def show
    #TODO: Add user?
    @movie = MovieFacade.new(url: params[:id]).movie
  end

  private

  def movie_service
    MovieService.new
  end
end
