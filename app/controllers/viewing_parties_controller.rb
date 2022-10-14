class ViewingPartiesController < ApplicationController

  before_action :set_users

  def new
    @viewing_party = ViewingParty.new(host_id: params[:user_id], movie_id: params[:movie_id])
  end

  def create   
    @viewing_party = ViewingParty.new(vp_params)

    if @viewing_party.save
      redirect_to user_path(params[:user_id])
    else
      flash[:alerts] = @viewing_party.errors.full_messages
      render :new
    end
  end

  private

  def vp_params
    params.require(:viewing_party).permit(
      :movie_id,
      :host_id,
      :duration,
      :date,
      :start_time,
      user_ids: []
    )
  end

  def set_users
    @user = User.find(params[:user_id])
    @other_users = User.all_except(params[:user_id])
  end

end