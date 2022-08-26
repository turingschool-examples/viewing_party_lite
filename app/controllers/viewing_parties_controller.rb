class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @users = User.all
    @movie = MovieDBFacade.movie(params[:movie_id])
  end
end 