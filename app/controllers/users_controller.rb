class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @parties = @user.parties
  end

  def new
  end



  def discover
    @user = User.find(params[:id])
  end


end
