class ViewingPartiesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @other_users = User.all_except(params[:user_id])
    @viewing_party = ViewingParty.new(host_id: params[:user_id], movie_id: params[:movie_id])
  end

  def create   
    @viewing_party = ViewingParty.create!(vp_params)
    @viewing_party.users << vp_invitees
    redirect_to user_path(params[:user_id])
  end

  private

  def vp_params
    params.require(:viewing_party).permit(
      :movie_id,
      :host_id,
      :duration,
      :date,
      :start_time
    )
  end

  def vp_invitees
    invitee_ids = params[:viewing_party][:users]
    invitee_ids.delete("")
    invitee_ids.map do |invitee_id|
      User.find(invitee_id)
    end
  end

end