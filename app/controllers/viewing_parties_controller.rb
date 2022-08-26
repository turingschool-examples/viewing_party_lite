class ViewingPartiesController < ApplicationController

  def new
    @users = User.all
    @movie = MovieFacade.find_movie_details(params[:movie_id])
  end

  def create
    binding.pry
  end
end
