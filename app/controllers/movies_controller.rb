class MoviesController < ApplicationController
  def index 
    @top_rated = MovieFacade.top_rated
  end
end