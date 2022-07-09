# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.other_users(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    movie = MovieFacade.movie_details(params[:movie_id])
    if params[:viewing_party][:duration].to_i < movie.runtime_mins
      flash[:alert] = "Duration of party must be longer than the runtime of the movie. #{movie.runtime_mins} mins"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing_party/new"
    elsif params[:viewing_party][:date].to_date < Date.today
      flash[:alert] = 'Date of party must be in the future.'
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing_party/new"
    else
      viewing_party = ViewingParty.create!(viewing_party_params)
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
  end

  private

  def viewing_party_params
    permitted = params.require(:viewing_party).permit(:date, :duration, :start_time)
    permitted[:movie_id] = params[:movie_id]
    permitted
  end
end
