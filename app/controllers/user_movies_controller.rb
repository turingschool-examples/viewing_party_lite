class UserMoviesController < ApplicationController
  def index
    if params[:search].present?
      keyword = params[:search]
      @search_results = MoviesFacade.search(keyword)
    else
      @top_movies = MoviesFacade.top_rated
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.movie(params[:id])
    @reviews = MoviesFacade.movie_reviews(params[:id])
    @cast = MoviesFacade.ten_movie_cast(params[:id])
  end
end
