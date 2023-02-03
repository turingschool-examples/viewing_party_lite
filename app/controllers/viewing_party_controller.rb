# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @viewing_party = ViewingParty.new
    @users = @user.all_other_users
  end

  def create
    user = User.find(params[:user_id])
    vp = ViewingParty.new(viewing_party_params)
    if vp.save
      ViewingPartyUser.create!(viewing_party: vp, user: user, hosting: true)
      viewing_party_users_params.each do |user_id|
        ViewingPartyUser.create!(viewing_party_id: vp.id, user_id: user_id, hosting: false) if User.exists?(user_id)
      end
      redirect_to user_path(user)
    else
      redirect_to new_user_movie_viewing_party_path(user, params[:movie_id])
      flash[:alert] = vp.errors.full_messages.to_sentence
    end
  end

  private

  def viewing_party_params
    params.require(:viewing_party).permit(:party_duration, :date, :start_time, :movie_id)
  end

  def viewing_party_users_params
    params[:viewing_party][:user_ids]
  end
end
