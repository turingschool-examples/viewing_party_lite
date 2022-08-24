class ViewingpartiesController < ApplicationController

  def new 
    @movie = MovieFacade.service(params[:movie_id]) 
  end

end