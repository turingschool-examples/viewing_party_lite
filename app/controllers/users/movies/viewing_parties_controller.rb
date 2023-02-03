class Users::Movies::ViewingPartiesController < ApplicationController
  def new
    # require 'pry'; binding.pry
    @user = User.find(params[:user_id])
    @guests = User.all_except(@user)
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    
  end
end