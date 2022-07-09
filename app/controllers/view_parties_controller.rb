class ViewPartiesController < ApplicationController
  def new
    @movie = MovieFacade.find_movie(params[:movie_id])
    @users = User.all
  end

  def create
    # binding.pry
    redirect_to "/users/#{params[:user_id]}"
  end
end
