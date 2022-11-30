class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(    name: params[:name],     email: params[:email])

    if @user.valid?
      @user.save
      redirect_to((root_path))
    else
      flash[:alert] = "Try Again"
    end
  end

  def show 
    @user = User.find(params[:id])
  end

  
end
