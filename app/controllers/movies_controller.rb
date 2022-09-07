class MoviesController < ApplicationController
  def index
  end

   def results
    @movies = MovieFacade.create_top_rated
    @user = User.find(params[:id])
  end
end