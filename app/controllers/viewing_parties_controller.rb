class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.get_movie_lite(params[:movie_id])
    @users = User.all.where('id != ?', @user.id)
  end
end