class Users::Movies::ViewingPartiesController < ApplicationController
  def new
    # require 'pry'; binding.pry
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
  end
end