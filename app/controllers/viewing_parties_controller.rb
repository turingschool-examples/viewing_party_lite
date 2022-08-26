class ViewingPartiesController < ApplicationController
  def new
    @attendees = User.where.not(id: params[:user_id])
    @host_user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    require "pry"; binding.pry
  end
end
