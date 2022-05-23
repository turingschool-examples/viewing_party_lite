class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    elsif params[:password_confirmation].empty?
      redirect_to "/register"
      flash[:invalid_email] = "Please confirm your password in the 'Password confirmation' field."
    elsif params[:password] != params[:password_confirmation]
      redirect_to "/register"
      flash[:invalid_email] = "Passwords must match."
    else
      redirect_to "/register"
      flash[:invalid_email] = "There is already an account associated with this e-mail address."
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
