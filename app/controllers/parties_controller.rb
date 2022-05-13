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
