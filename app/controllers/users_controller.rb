class UsersController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    # require 'pry'; binding.pry
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/register'
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  def show
  end

  private

  def user_params
    params.permit(:name, :email)
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    
  end
end