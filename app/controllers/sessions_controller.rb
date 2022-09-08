class SessionsController < ApplicationController

  def new 
  end

  def create
    user = User.find_by(email: params[:email]) 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to "/users/#{user.id}"
      else
      flash[:error] = "Your login information is incorrect. Please try to login again."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end