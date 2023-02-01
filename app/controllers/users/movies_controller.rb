class Users::MoviesController < ApplicationController
  
  def index
    @top_movies = movie_service.get_top_movies
  end

  private

  def movie_service
    MovieService.new
  end
end
