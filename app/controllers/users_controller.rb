# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/register'
      flash[:alert] = "Error: #{error_message(user.errors)}"
      
    end
    # binding.pry
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
