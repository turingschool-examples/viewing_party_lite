# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    @user = current_user
    @viewing_party = ViewingParty.new
    @movie = MovieFacade.create_individual_movie(params[:movie_id])
    @users = User.other_users(@user)
  end

  def create
    ViewingParty.create!(view_params)
    redirect_to user_path(current_user), notice: 'View Party created successfully'
  end

  private

  def view_params
    params.require(:form_info).params.permit(:duration, :date, :time)
  end

  def user_view_params
    params.require(:users)
  end

  def current_user
    User.find(params[:user_id])
  end
end
