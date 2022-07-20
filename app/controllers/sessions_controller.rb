class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, invalid login."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end