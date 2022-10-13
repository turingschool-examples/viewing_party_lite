class ViewingPartiesController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details_poro(params[:movie_id])
  end
end
