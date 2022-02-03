class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieService.movie_info(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieService.movie_info(params[:id])
    party = Party.new()
  end

  private
  def party_params
    params.permit(:host_id, :duration, :day, :start_time, :movie_id, :user_ids)
  end
end
