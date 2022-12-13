# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_for_user, only: :show

  def index
    @users = User.all
  end

  def new; end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id

      redirect_to "/dashboard"
    else
      redirect_to '/register'
      flash[:alert] = user.errors.full_messages.to_sentence
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def check_for_user
    unless current_user
      flash[:alert] = 'Error: You must be logged in to visit dashboard'
      return redirect_to '/'
    end
  end
end
