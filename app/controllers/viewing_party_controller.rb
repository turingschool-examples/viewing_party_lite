class ViewingPartyController < ApplicationController
  def new
    @users = User.all
    @host = User.find(params[:user_id])
    @movie = MovieFacade.new.details(params[:id])
  end

  def create
    @host = User.find(params[:user_id])
    @party = Party.create!(
      start_date: "#{params['start_date(1i)']}-#{params['start_date(2i)']}-#{params['start_date(3i)']}",
      start_time: "#{params['start_time(4i)']}:#{params['start_time(5i)']}",
      duration: params["duration"],
      movie_id: params["id"],
      host_id: params["user_id"]
    )
    params[:invitations].drop(1).each do |user_id|
      UserParty.create!(user_id: user_id, party_id: @party.id)
    end
    redirect_to user_path(@host.id)
  end
end
