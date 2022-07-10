# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @host = User.find(params[:id])
    @users = User.all
  end

  def create
    @movie = MovieFacade.movie_details(params[:movie_id])
    @host = User.find(params[:id])
    params[:invitees].delete("")
    if @movie.runtime > params[:duration].to_i
      flash[:notice] = 'Party duration must be greater than movie runtime'
      redirect_to "/users/#{@host.id}/movies/#{@movie.id}/viewing-party/new"
    elsif (params[:invitees].length > 0)
      @party = Party.create!(party_params)
      UserParty.create!(user_id: @host.id, party_id: @party.id, host: true)
      params[:invitees].each do |invitee_id|
        UserParty.create!(user_id: invitee_id.to_i, party_id: @party.id, host: false)
      end
      redirect_to "/users/#{@host.id}/viewing-party/dashboard"
    else
      @party = Party.create!(party_params)
      UserParty.create!(user_id: @host.id, party_id: @party.id, host: true)
      redirect_to "/users/#{@host.id}/viewing-party/dashboard"
    end
    # binding.pry
  end

  def dashboard
    @user = User.find(params[:id])
    
    # @hosted_parties = @user.hosted_parties
    # @invited_parties = @user.invited_parties
  end

  private

  def party_params
    params.permit(:date, :duration, :title, :start, :movie_id)
  end
end
