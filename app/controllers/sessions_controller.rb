class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.user_name}!"
      redirect_to users_dashboard_path
    else
      flash[:error] = 'Invalid Credentials'
      redirect_to login_path
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end
end