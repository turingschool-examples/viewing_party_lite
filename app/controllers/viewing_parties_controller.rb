# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @users = User.all.where.not(name: @user.name)
    @movie = MovieFacade.details_poro(params[:movie_id])
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details_poro(params[:movie_id])
    @users = User.all.where.not(name: @user.name)

    party = ViewingParty.new(duration: params[:duration], date: params[:date], time: params[:time], host_id: @user.id, movie_id: params[:movie_id])
    if params[:duration].to_i < @movie.runtime.to_i 
      flash[:notice] = "Party duration must be greater than movie runtime and all fields must be filled in "
      render :new
    elsif party.save
      invited_users = []
      params[:user].select do |user_id|
        if user_id != "0"
          invited_users << user_id.to_i
        end
      end
      invited_users << @user.id
      invited_users.each do |user|
        ViewingPartyUser.create(viewing_party_id: party.id, user_id: user)
      end
      redirect_to user_path(@user)
    else
      flash.alert = party.errors.full_messages.to_sentence
      render :new
    end
 
  end

  def viewing_party_params
    params.permit(:duration, :date, :time, :movie_id)
  end
end


