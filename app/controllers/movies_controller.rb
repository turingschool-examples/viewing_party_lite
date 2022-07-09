class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:movie_search].present?
      @movies = MovieFacade.all_movie_id_search(id)
    else
      @movies = MovieFacade.top_rated_array

    binding.pry
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.movie_id_search(params[:id])
    @movie_cast = MoviesFacade.movie_cast(params[:id]).first(10)
    @movie_review = MoviesFacade.movie_reviews(params[:id])
  end
end

