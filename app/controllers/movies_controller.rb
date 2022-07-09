class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @movies = MovieFacade.create_top_rated
  end
end
