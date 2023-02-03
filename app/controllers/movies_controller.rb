class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:q] != "top%20rated"
      keyword = params[:q]
      @search_results = MovieSearchFacade.movie_search(keyword)
    else
      @search_results = []
      @top_rated = TopRatedMoviesFacade.top_20_rated_movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    movie_id = params[:id]
    @movie = TMDBService.get_movie_by_id(movie_id)
    @cast = MovieCastFacade.cast(movie_id)
    @reviews = MovieReviewFacade.movie_review(movie_id)

  end
end