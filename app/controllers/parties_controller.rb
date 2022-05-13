class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.single_movie(params[:id])
    @users = User.all
  end
end
