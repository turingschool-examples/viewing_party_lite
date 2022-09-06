class LoginController < ApplicationController

  def login_form

  end

  def login
    user = User.find_by(name: params[:name])
    if User.find_by(name: params[:name])&.authenticate(params[:password])
      redirect_to user_path(User.find_by(name: params[:name])&.authenticate(params[:password]))
      flash[:success] = "Welcome, #{user.name}!"
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to "/login"
    end
  end

end
