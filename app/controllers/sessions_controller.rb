class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    user = User.new(user_params)
    if user.save
      redirect_to root_path
      flash[:success] = "Weclome #{user.email}!"
    else
      redirect_to '/users/new'
      flash[:error = user.errors.full_messages]
    end
  end
end