# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user)
    elsif user.errors.full_messages == ['Email has already been taken']
      flash[:alert] = 'Oops, that email is already in use! Please try again with a unique email.'
      redirect_to '/register'
    elsif user.errors.full_messages == ["Name can't be blank"]
      flash[:alert] = 'Please enter a valid name.'
      redirect_to '/register'
    else
      flash[:alert] = 'Please enter a valid name and unique e-mail address.'
      redirect_to '/register'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
