class UsersController < ApplicationController
  before_action :find_user, only: [:show, :discover]

  def show
    @user = User.find(params[:id])
  end

  def new
  end


  def discover
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
      flash[:success] = "Welcome, #{@user.name}!"
    else
      redirect_to "/register"
      flash[:error] = "#{@user.errors.full_messages}"
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
