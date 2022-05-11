class MoviesController < ApplicationController
  def index
    movies = MovieService.get_top_rated
  end
  def results

    if params[:q] == "top rated"
      @movies = MovieFacade.top_rated
    end


  end
end
