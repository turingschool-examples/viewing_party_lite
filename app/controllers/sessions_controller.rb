class SessionsController < ApplicationController
  def new; end

  def create
    # require 'pry'; binding.pry
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      redirect_to user_path(user)
      flash[:alert] = "Welcome, #{user.name}! You are now logged in"
    else
      flash[:alert] = 'Unrecognized email/password combination'
      render 'new'
    end
  end
end