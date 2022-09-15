class MoviesController < ApplicationController
  def index
  end

   def results
    @movies = MovieFacade.create_top_rated
    # @user = User.find(params[:id])
    @user = User.find(session[:user_id])
  end
end