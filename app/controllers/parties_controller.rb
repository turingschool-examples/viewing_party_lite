# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    # require 'pry'; binding.pry
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(party_params[:movie_id])
    @users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @party = Party.create!(party_params)
    host = params[:host]
    invited = params[:invited]
    invited.each do |user|
      PartyUser.create!(party_id: @party.id, user_id: user.id)
    end
  end

  private

  def party_params
    params.permit(:movie_id, :start_time, :duration)
  end
end
