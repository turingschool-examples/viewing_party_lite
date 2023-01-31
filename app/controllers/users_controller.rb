class UsersController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    # require 'pry'
    # binding.pry
    user = User.create(user_params)
    if user.save

      redirect_to user_path(user)
    else
      # require 'pry'
      # binding.pry
      flash[:notice] = "Name can't be blank"
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
