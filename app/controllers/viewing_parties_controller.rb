# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  before_action :find_user

  def new
    @movie = MoviesFacade.get_movie_heavy(params[:movie_id])
    @users = User.find_all_except(@user)
  end

  def create
    party = MovieParty.create!(viewing_party_params)
    party.create_user_movie_parties(@user, params[:invitees])

    redirect_to user_path(@user)
  end

  private

  def viewing_party_params
    params.permit(:movie_id, :movie_title, :duration, :start_time)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
