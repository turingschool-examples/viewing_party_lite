class MoviesController < ApplicationController

  def show
    @user = User.find(params[:id])

    @movie = MovieDBFacade.movie(params[:movie_id])
    @cast = MovieDBFacade.cast_members(params[:movie_id])
    @review = MovieDBFacade.movie_reviews(params[:movie_id])
  end
end
