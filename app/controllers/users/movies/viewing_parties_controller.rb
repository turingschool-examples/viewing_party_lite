class Users::Movies::ViewingPartiesController < ApplicationController
  def new
    # require 'pry'; binding.pry
    @user = User.find(params[:user_id])
    @guests = User.all_except(@user)
    @movie = MovieFacade.movie_details(params[:movie_id])
  end
  
  def create
    viewing_party = ViewingParty.new(viewing_party_params)
    
    if viewing_party.save
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "Error"
      redirect_to new_user_movie_viewing_party_path(params[:user_id], params[:movie_id])
    end
  end

private
  def viewing_party_params
    params.permit(:duration, :user_id, :movie_id, :start_time, :day, :runtime)
  end
  
end