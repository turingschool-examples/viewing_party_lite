class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:user_id] || params[:id])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome, #{user.email}!"
    else
      render :new, notice: "Sorry, your credentials are bad."
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end