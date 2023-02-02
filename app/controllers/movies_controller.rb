class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])


    if params[:q] != "top%20rated"
      @search_results = MovieSearchFacade.movie_search(params[:q])
    else
      @search_results = []
      @top_rated = TopRatedMoviesFacade.top_20_rated_movies
    end
  end

  def show
    movie_id = params[:id]
    load_movies = TMDBService.new
    @movie = load_movies.movie_by_id(movie_id)
  end
end