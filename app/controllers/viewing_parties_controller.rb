# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    viewing_party = ViewingParty.create!(date: params[:viewing_party][:date],
                                         duration: params[:viewing_party][:duration], start_time: params[:viewing_party][:start_time], movie_id: params[:movie_id])
    invite_ids = []
    params[:viewing_party].each do |key, _value|
      invite_ids << key if key.to_i.positive? && params[:viewing_party][key] == '1'
    end
    UserViewingParty.create!(user_id: params[:user_id], viewing_party_id: viewing_party.id, hosting: true)
    invite_ids.each do |invite_id|
      UserViewingParty.create!(user_id: invite_id, viewing_party_id: viewing_party.id, hosting: false)
    end
    redirect_to "/users/#{params[:user_id]}"
  end

  # private
  #   def viewing_party_params
  #     # binding.pry
  #     params[:viewing_party].permit(:date, :duration, :start_time)
  #     params.permit(:movie_id)
  #   end
end
