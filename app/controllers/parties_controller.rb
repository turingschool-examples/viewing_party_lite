class PartiesController < ApplicationController

  def index

  end

  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @movie = MovieFacade.find(params[:movie_id])
  end
end