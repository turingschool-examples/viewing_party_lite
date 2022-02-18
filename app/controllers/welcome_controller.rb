class WelcomeController < ApplicationController
  def index
    @users = User.all
  end

  def login_form
  end

  def login
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/dashboard", notice: "Welcome Back #{user.username}"
    else
      redirect_to "/login", notice: "Password is not correct"
    end
  end
end
