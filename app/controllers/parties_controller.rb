class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieFacade.movie_details(params[:movie_id])
    @party = Party.new(party_params)
    
    if @party.save 
      flash.notice = "Party was successfully added!"
      redirect_to(user_path(user))
    else
      flash.alert = "ERROR not saved!"
      redirect_to(new_user_movie_party_path(user, movie.id))
    end
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time, :host_id, :movie_id)
  end
end
