# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(party_params[:movie_id])
    @users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(party_params[:movie_id])
    @party = Party.create!(party_params)
    PartyUser.create!(party: @party, user_id: params[:user_id], host: true)
    invited = params[:invited]
    invited.each do |user, _invited|
      PartyUser.create!(party: @party, user_id: user, host: false)
    end
    redirect_to user_path(@user)
  end

  private

  def party_params
    params.permit(:movie_id, :movie_title, :start_time, :duration)
  end
end
