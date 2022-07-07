class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    # code
    # binding.pry
    if params[:q] == 'top20rated'

    end
  end
end
