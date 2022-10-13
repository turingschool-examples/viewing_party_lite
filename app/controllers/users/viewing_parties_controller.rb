class Users::ViewingPartiesController < ApplicationController
  def new
    @host = User.find(params[:user_id]) 
    @friends = @host.friends
    @movie = MoviesFacade.details(params[:movie_id])
  end

  def create
    host = User.find(params[:user_id])
    invitees = User.invited_users(params[:users])
    viewing_party = ViewingParty.new(viewing_party_params)
    if params[:duration] >= params[:movie_duration] 
      if viewing_party.save
        ViewingPartyUser.create!(
          user_id: host.id,
          viewing_party_id: viewing_party.id,
          hosting: true
        )
        invitees.each do |invitee|
          ViewingPartyUser.create!(
            user_id: invitee.id,
            viewing_party_id: viewing_party.id,
            hosting: false
          )
        end
        redirect_to user_path(host)
      else
        redirect_to new_user_movie_viewing_party_path(host, params[:movie_id])
        flash[:alert] = "Error: #{error_message(viewing_party.errors)}"
      end
    else
      redirect_to new_user_movie_viewing_party_path(host, params[:movie_id])
      flash[:alert] = "Error: Duration cannot be shorter than movie runtime"
    end
  end

  private

  def viewing_party_params
    params.permit(:duration, :start_time, :movie_id, :movie_title, :host_id)
  end
end