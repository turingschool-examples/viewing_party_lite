class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.nil? || !user.authenticate(params[:password])
      flash[:notice] = "Email or password are incorrect"
      render :new
    else
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name}!"
      redirect_to "/dashboard"
    end
  end

  def destroy
    session.destroy
    redirect_to "/"
  end
end
