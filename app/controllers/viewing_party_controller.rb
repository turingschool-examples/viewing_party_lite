class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details(params[:movie_id])
    @invitees = User.where.not(id: params[:user_id])
  end
end