class ViewingPartiesController < ApplicationController
  def new
    @movie = MoviesFacade.movie(params[:id])
    @all_users = User.all
    @user = User.find(params[:user_id])
  end

  def create; end

  def show; end
end
