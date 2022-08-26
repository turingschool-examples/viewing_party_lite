class ViewingPartiesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @movie = MOvieFacade.movie_details(params[:movie_id])
  end

  def create
    
  end
end