class UsersController < ApplicationController

  def show

  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:error] = "Error: #{user.errors.full_messages.join(", ")}"
    end
  end


  private

  def user_params
    params.permit(:name, :email)
  end
end
