class MoviesController < ApplicationController
  def index
    load_movies = TMDBService.new
    @top_rated = load_movies.get_top_rated_movies
    @search_results = load_movies.movie_search(params[:search_keyword])
  end
end