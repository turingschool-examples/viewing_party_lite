class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        redirect_to "/users/#{user.id}"
      else
        flash[:invalid_password] = "Invalid password."
        redirect_to "/login"
      end
    else
      flash[:invalid_email] = "There is no account associated with this email address."
      redirect_to "/login"
    end
  end
end
