# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  before_action :find_user

  def new
    @movie = MoviesFacade.get_movie_heavy(params[:movie_id])
    @users = User.find_all_except(@user)
  end

  def create
    party = MovieParty.new(viewing_party_params)
    if party.save
      party.create_user_movie_parties(@user, params[:invitees])
      redirect_to '/dashboard'
    else
      flash[:alert] = 'Error: Datetime field cannot be left blank'
      redirect_to new_movie_viewing_party_path(party.movie_id)
    end
  end

  private

  def viewing_party_params
    params.permit(:movie_id, :movie_title, :duration, :start_time)
  end

  def find_user
    @user = current_user
  end
end
