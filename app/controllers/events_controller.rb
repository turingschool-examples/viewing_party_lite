class EventsController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])

    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end
end