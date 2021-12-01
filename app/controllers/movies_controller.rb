class MoviesController < ApplicationController
  def index
    require "pry"; binding.pry
    @user = User.find(params[:user_id])
  end
end
