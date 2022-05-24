class SessionsController < ApplicationController
  def login_form
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      flash[:error] = "Incorrect Email"
      render :login_form
    else
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome #{user.name}!"
        redirect_to "/users/#{user.id}"
      else
      flash[:error] = "Incorrect Password"
      render :login_form
      end 
    end 
  end 





end 