class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email]) if User.exists?(email: params[:email]) 
    if !User.exists?(email: params[:email])
      flash[:alert] = "Error: Invalid email address"
      render :new
    elsif !user.authenticate(params[:password])
      flash[:alert] = "Error: Invalid password"
      render :new
    else
      session[:user_id] = user.id
      flash[:alert] = "Welcome, #{user.email}"
      redirect_to dashboard_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
