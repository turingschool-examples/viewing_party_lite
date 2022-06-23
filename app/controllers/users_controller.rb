class UsersController < ApplicationController

  def new
  end

  def show
    if current_user.nil?
      redirect_to "/"
      flash[:notice] = "You must login or register to visit your dashboard."
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/dashboard"
    else
      redirect_to "/register"
      flash[:notice] = user.errors.full_messages.to_sentence
    end
  end

private
  def user_params
    params.permit(:name, :email, :password_confirmation, :password)
  end
end
