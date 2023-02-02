class ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @viewing_party = ViewingParty.new
  end

  def create

  end
end
