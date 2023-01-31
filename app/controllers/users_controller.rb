class UsersController < ApplicationController
  def discover_movies
    @user = User.find(params[:id])
  end


end