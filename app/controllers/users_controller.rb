class UsersController < ApplicationController
  def new

  end


  def show
    # require "pry"; binding.pry
    @user = User.find(params[:id])
  end
end
