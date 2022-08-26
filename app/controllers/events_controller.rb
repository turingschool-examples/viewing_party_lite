class EventsController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    
    event = Event.new()
  end
end