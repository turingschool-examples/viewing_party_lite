class MoviesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.movie_id_search(params[:id])
    @movie_cast = MoviesFacade.movie_cast(params[:id]).first(10)
    @movie_review = MoviesFacade.movie_reviews(params[:id])
    # require "pry"; binding.pry
  end
end
