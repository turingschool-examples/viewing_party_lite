class ViewingPartyController < ApplicationController
  def new
    @viewing_party = ViewingParty.new
    @user = User.find(params[:user_id])
    @users = User.where.not("id=#{params[:user_id]}")
    @movie = MovieFacade.all_movie_info(params[:movie_id])
    # require 'pry', binding.pry
  end

  def create
    viewing_party = ViewingParty.new(viewing_party_params)
    if viewing_party.save
      redirect_to user_path(params[:user_id])
    end
  end

  private

  def viewing_party_params
    params.permit(:movie_id, :duration, :start_day, :start_time)
  end
end