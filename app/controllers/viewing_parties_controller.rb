class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieFacade.get_movie(params[:movie_id])
    
  end
end