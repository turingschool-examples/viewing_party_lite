class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.top_rated
  end
end
