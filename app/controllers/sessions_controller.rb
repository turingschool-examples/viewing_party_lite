class SessionsController < ApplicationController 
  def new 
  end

  def create 
    user = User.find_by(email:params[:email])
    if user&.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.email}!"
      session[:user_id] = user.id 
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  def destroy
    session.destroy 
    redirect_to "/"
  end
end