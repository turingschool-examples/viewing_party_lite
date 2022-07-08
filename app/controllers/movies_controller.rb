class MoviesController < ApplicationController
  def index
    if params[:q] == "top rated"
      @all_movies = MovieFacade.top_rated
    elsif params[:Search]
      @movie_search = MovieFacade.search(params[:Search])
    end
  end
end
