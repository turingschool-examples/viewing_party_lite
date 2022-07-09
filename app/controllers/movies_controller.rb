class MoviesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.movie_id_search(params[:id])
    # require "pry"; binding.pry
  end
end
