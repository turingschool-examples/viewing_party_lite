class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to "/dashboard"
      else
        flash[:invalid_password] = "Invalid password."
        redirect_to "/login"
      end
    else
      flash[:invalid_email] = "There is no account associated with this email address."
      redirect_to "/login"
    end
  end

  def destroy
    session.destroy
    redirect_to "/"
  end
end
