class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.single_movie(params[:id])
    @host = User.find_by_id(params[:host_id])
    @users = User.all.find_all {|user| user != @host}
  end

  def create
    movie = MovieFacade.single_movie(params[:id])
    party = Party.new(party_params)
    host = User.find_by_id(params[:host_id])
    users = User.all.find_all {|user| user != @host}
    if party[:duration].to_i < movie.runtime
      flash[:notice] = "Party can't be shorter than Movie's runtime."
      redirect_to "/users/#{params[:host_id]}/movies/#{params[:id]}/viewing-party/new"
    elsif party.save
      PartyUser.create!(party_id: party.id, user_id: host.id)
      invitees_ids = params[:tag_ids].find_all {|id| id != '0' }
      invitees = invitees_ids.each do |id|
        PartyUser.create!(party_id: party.id, user_id: id)       
      end
       redirect_to "/users/#{params[:host_id]}"
     else
       flash[:notice] = "Please fill out all fields"
       redirect_to "/users/#{params[:host_id]}/movies/#{params[:id]}/viewing-party/new"
    end
  end

  private
  def party_params
    params.permit(:name, :duration, :date, :start_time, :host_id)
  end
end

