class UserMoviesController < ApplicationController
  def index
    @top_movies = MoviesFacade.top_rated
 
  end
end
