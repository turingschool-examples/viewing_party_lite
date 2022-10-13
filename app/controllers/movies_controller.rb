class MoviesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_by_id(params[:movie_id])
    @top_10_cast = MovieFacade.top_10_cast(params[:movie_id])
    @reviews = ReviewFacade.get_review_info(params[:movie_id])
  end
end