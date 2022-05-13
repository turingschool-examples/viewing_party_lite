class PartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.search_by_id(params[:movie_id])
  end
end
