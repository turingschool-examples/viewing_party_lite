class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        redirect_to user_path(@user)
      else
        flash[:alert] = "Error : #{error_message(user.errors)}"
        render new
    end
  end


  private
    def user_params
      params.permit(:name, :email)
    end
end
