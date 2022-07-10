class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieFacade.create_movie_details(params[:movie_id])
    @user = User.find(params[:id])
    @users = User.all
  end

  def create
  end

end
