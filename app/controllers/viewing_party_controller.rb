class ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @viewing_party = ViewingParty.new
    @users = User.where.not(id: params[:user_id]) #maybe move to a model method
  end

  def create

  end
end
