class UsersController < ApplicationController
  def new

  end


  def show
    # @user = User.find(session[:user_id]) if session[:user_id]
    # if @user.nil?
    #   redirect_to root_path
    #   flash.notice = "Please login or register to access dashboard"
    # end
  end
end
