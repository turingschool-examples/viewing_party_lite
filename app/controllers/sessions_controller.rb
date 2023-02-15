class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = ['Login Failed']
      render :new
    end
  end

  def delete
    session.clear
    redirect_to root_path
  end
end