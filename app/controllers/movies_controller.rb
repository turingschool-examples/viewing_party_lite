class MoviesController < ApplicationController
  def index
    if params[:q] == "top rated"
      @all_movies = MovieFacade.get_top_rated
    elsif params[:Search]
      @movie_search = MovieFacade.search(params[:Search])
    end
  end

  def show
    @movie = MovieFacade.movie_data(params[:id])
  end
end
