class ViewingPartyController < ApplicationController
  def new
    @movie = MoviesFacade.movie(params[:movie_id])
    @reviews = MoviesFacade.movie_reviews(params[:movie_id])
  end
end
