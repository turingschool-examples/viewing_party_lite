class MoviesController < ApplicationController
  def index
    load_movies = TMDBService.new
    if params[:q] != "top%20rated"
      @search_results = load_movies.movie_search(params[:q])
    else
      @search_results = []
      @top_rated = load_movies.get_top_rated_movies
    end
  end
end