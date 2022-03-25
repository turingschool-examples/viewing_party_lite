class ViewingPartyController < ApplicationController
  def new

    @users = User.all
    @host = User.find(params[:user_id])
    @movie = MovieFacade.new.details(params[:id])
    # binding.pry
    @party = Party.new
  end

  def create
    # binding.pry
    @host = User.find(params[:user_id])
    @party = Party.create(
      start_date: params["start_date"],
      start_time: params["start_time"],
      duration: params["duration"],
      movie_id: params["id"],
      host_id: params["user_id"]
    )
    if @party.save
      redirect_to user_path(@host.id)
    else
      redirect_to "/users/#{@host.id}/movies/#{params[:id]}/viewing_party/new"
    end
  end
end

private

  def party_params
    params.permit(:start_date, :start_time, :duration, :movie_id, :host_id)
  end
