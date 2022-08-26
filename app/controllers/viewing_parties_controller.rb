class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieFacade.find_movie_details(params[:movie_id])
  end

end
