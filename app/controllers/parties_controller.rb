# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @host = User.find(params[:id])
    @users = User.all
  end

  def create
    # @party = Party.new
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
    else
      @party = Party.create!(party_params)
      UserParty.create!(user_id: @host.id, party_id: @party.id, host: true)
    end
  end

  private

  def party_params
    params.permit(:date, :duration, :title, :start)
  end
end
