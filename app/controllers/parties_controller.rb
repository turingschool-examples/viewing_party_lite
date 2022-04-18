# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie(params[:movie_id])
  end

  def create
    @host = User.find(params[:user_id])
    @party = Party.create!(
      date: "#{params['date(1i)']}-#{params['date(2i)']}-#{params['date(3i)']}",
      start_time: "#{params['start_time(4i)']}:#{params['start_time(5i)']}",
      duration: params["duration"],
      movie_id: params["movie_id"],
      host_id: @host.id
    )
    PartyUser.create!(user_id: @host.id, party_id: @party.id)
    redirect_to user_path(@host.id)
  end

  private
  def party_params
    params.permit(:duration, :date, :time, :movie_id, :host_id)
  end
end
