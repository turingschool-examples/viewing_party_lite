class ViewingPartyController < ApplicationController 
  def new 
    @user = User.find(params[:user_id])
    @uninvited = User.where.not(id: @user.id)
    @movie = TmdbFacade.details(params[:movie_id])
  end

  def create 
    redirect_to user_path(params[:user_id])
  end
end