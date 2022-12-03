
class ViewingPartyController < ApplicationController 

  def show 
    @party = ViewingParty.find(params[:id])
  end
  
  def new 
    @user = User.find(params[:user_id])
    @movie_id = (params[:movie_id])
  end

  def create 
    user = User.find(params[:user_id])
    party = ViewingParty.create!(viewing_party_params)
    user_party = UserViewingParty.create!(user_id: user.id, viewing_party_id: party.id)
    redirect_to "/users/#{user.id}"
  end

  private

  def viewing_party_params
    params.permit(:id, :duration, :date, :host_id, :movie_id)
  end
end
