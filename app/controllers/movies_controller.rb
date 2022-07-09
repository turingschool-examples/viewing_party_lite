class MoviesController < ApplicationController
  def index
    # binding.pry
    @user = User.find(params[:user_id])
    @movies = MovieFacade.top_rated_array
  end
end