class SessionsController < ApplicationController
  # before_action :set_user, only: [:create]
  def new

  end

  def create
    user = User.find_by(email: params[:email]) if User.exists?(email: params[:email])
    if user.nil? || !user.authenticate(params[:password])
      flash[:alert] = "Error: Invalid email address or password"
      render :new
      return
    end
    
    session[:user_id] = user.id
    if user.role == 'admin'
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
    flash[:alert] = "Welcome, #{user.email}"
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end

  private
  
  # def set_user
  #   if User.exists?(email: [params[:email]]) && User.find_by(email: params[:email]).authenticate(params[:password])
  #     user = User.find(session[:user_id])
  #   else
  #     flash[:alert] = "Error: Invalid email address or password"
  #     render :new
  #   end
