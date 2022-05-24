class UsersController < ApplicationController
  before_action :current_user, only: [:show]

  def new
  end

  def show
    @user = current_user
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

  def current_user
    User.find(session[:user_id])
  end
end
