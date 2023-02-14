# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  def new
    if session[:user_id]
      @user = User.find(session[:user_id])
      @movie = MovieFacade.get_movie(params[:movie_id])
      @users = User.where("id != #{@user.id}")
    else
      flash[:alert] = "You must be logged in or registered to create a viewing party"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}"
    end
  end

  def create
    @user = User.find(params[:host_id])
    @viewing_party = ViewingParty.create!(create_params)
    @viewing_party.save
    @invitees = User.where(id: params[:user_ids].reject(&:empty?))
    @viewing_party.users = @invitees
    ViewingPartyUser.create!(user_id: @user.id, viewing_party_id: @viewing_party.id)

    redirect_to "/users/#{@user.id}"
  end

  private

  def create_params
    params.permit(:duration, :party_date, :party_time, :host_id, :movie_id)
  end
end
