class ViewingPartyController < ApplicationController
  def new
    @movie = MoviesFacade.movie(params[:movie_id])
  end
end
