class ViewPartiesController < ApplicationController
  def new
    @movie = MovieFacade.find_movie(params[:movie_id])
  end
end
