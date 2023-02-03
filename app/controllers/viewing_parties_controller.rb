class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieFacade.get_movie(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.where("id != #{@user.id}")
  end

  def create
    @user = User.find(params[:host_id])
    @viewing_party = ViewingParty.create!(create_params)
    @viewing_party.save
    @invitees = User.where(id: params[:user_ids].reject { |u| u.empty? })
    @viewing_party.users = @invitees
    ViewingPartyUser.create!(user_id: @user.id, viewing_party_id: @viewing_party.id)
    
    redirect_to "/users/#{@user.id}"
  end

  private

  def create_params
    params.permit(:duration, :party_date, :party_time, :host_id)
  end

end