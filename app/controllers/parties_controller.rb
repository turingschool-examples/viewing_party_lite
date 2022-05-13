class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.find_movie(params[:id])
    @user = User.find(params[:id])
    @users = User.all
  end

  def create
    party = Party.new(party_params)
    if party.save
      redirect_to
  end

private

    def party_params
      params.permit(:id, :duration, :date, :time, :host)
end
