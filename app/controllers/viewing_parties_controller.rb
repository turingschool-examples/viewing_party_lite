class ViewingPartiesController < ApplicationController
  before_action :find_user

  def new
    @movie = MovieFacade.create_single_movie(params[:movie_id])
  end

  def create
    @party = Party.create(viewing_party_params)
    # creates an empty string so we need to shift
    params[:invite_users].shift
    invitees_id = params[:invite_users]
    invitees_id.each do |invitee_id|
      PartyUser.create!(user_id: invitee_id, party_id: @party.id)
    end
    PartyUser.create!(user_id: params[:id], party_id: @party.id)
    redirect_to "/users/#{@user.id}"
  end

  private

  def viewing_party_params
    {
      start_time: params[:start_time],
      host: params[:id],
      duration: params[:duration],
      movie_id: params[:movie_id],
      host_name: @user.name
    }
  end
end
