# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    if current_user
      @movie = MovieFacade.movie_details(params[:movie_id])
      @host = User.find(session[:user_id])
      @users = User.all
    else
      flash[:error] = "You must be logged in to create a viewing party"
      redirect_to "/users/movies/#{params[:movie_id]}"
    end
  end

  def create
    @movie = MovieFacade.movie_details(params[:movie_id])
    @host = User.find(session[:user_id])
    params[:invitees].delete('')
    if @movie.runtime > params[:duration].to_i
      flash[:notice] = 'Party duration must be greater than movie runtime'
      redirect_to "/users/movies/#{@movie.id}/viewing-party/new"
    elsif params[:invitees].length.positive?
      @party = Party.create!(party_params)
      UserParty.create!(user_id: @host.id, party_id: @party.id, host: true)
      params[:invitees].each do |invitee_id|
        UserParty.create!(user_id: invitee_id.to_i, party_id: @party.id, host: false)
      end
      redirect_to "/users/viewing-party/dashboard"
    else
      @party = Party.create!(party_params)
      UserParty.create!(user_id: @host.id, party_id: @party.id, host: true)
      redirect_to "/users/viewing-party/dashboard"
    end
    # binding.pry
  end

  def dashboard
    @user = User.find(session[:user_id])

    # @hosted_parties = @user.hosted_parties
    # @invited_parties = @user.invited_parties
  end

  private

  def party_params
    params.permit(:date, :duration, :title, :start, :movie_id)
  end
end
