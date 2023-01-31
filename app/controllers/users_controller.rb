class UsersController < ApplicationController
  def new
    User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    elsif @user.name == "" || @user.email == "" 
      redirect_to new_user_path, notice: "Field can't be blank."
    else 
      redirect_to new_user_path, notice: "Enter valid name and email."
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  
  def user_params
    params.permit(:name, :email)
  end
end