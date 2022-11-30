class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id)
    else
      redirect_to "/register", alert: "Your request could not be completed, please fill out all fields/choose an email that has not already been claimed"
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end