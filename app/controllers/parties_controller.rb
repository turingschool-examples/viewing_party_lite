class PartiesController < ApplicationController

  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    user = User.find(params[:user_id])
    party = Party.create(party_params)
    redirect_to "/users/#{user.id}"
  end

  private

  def party_params
    params.permit(:movie_id, :duration_time, :start_date, :start_time, :user_id, :movie_name)
  end

end
