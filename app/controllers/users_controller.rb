class UsersController < ApplicationController
  def show
    if current_user
      @user = User.find(session[:user_id])
    else
      redirect_to "/"
      flash[:login] = "You must be logged in to access the Dashboard."
    end
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/login"
    else
      redirect_to "/register"
      flash[:notice] = user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
