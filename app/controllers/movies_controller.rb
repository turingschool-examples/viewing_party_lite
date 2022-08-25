class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def show
  end
end