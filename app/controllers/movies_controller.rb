class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
  end
  
  def results
    @user = User.find(params[:id])
    @facade = MovieFacade.new
  end
end