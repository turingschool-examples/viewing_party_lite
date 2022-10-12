# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    @user = current_user
    @viewing_party = ViewingParty.new
    @movie = MovieFacade.create_individual_movie(params[:movie_id])
    @users = User.other_users(@user)
  end

  def create
    party = ViewingParty.create!(view_params)
    # TODO: Is there a way this can be moved or does this belong here?
    user_view_params.each do |user_arr|
      UserViewingParty.create!(user_id: user_arr[0], viewing_party_id: party.id, role: 0) if user_arr[1] == 1
    end
    UserViewingParty.create!(user_id: current_user, viewing_arty_id: party.id, role: 1)
    redirect_to user_path(current_user), notice: 'View Party created successfully'
  end

  private

  def view_params
    params.require(:form_info).permit(:duration, :date, :time, :movie_id)
  end

  def user_view_params
    params.require(:users)
  end

  def current_user
    User.find(params[:user_id])
  end
end
