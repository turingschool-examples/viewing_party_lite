class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.single_movie(params[:id])
    @host = User.find_by_id(params[:user_id])
    @users = User.all.find_all {|user| user != @host}
  end
end
