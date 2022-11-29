# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    elsif user_params[:name].blank? && !user_params[:email].blank?
      redirect_to '/register'
      flash[:alert] = 'ERROR: Please enter a valid name'
    elsif !user_params[:name].blank? && user_params[:email].blank?
      redirect_to '/register'
      flash[:alert] = 'ERROR: Please enter a valid email'
    elsif user_params[:name].blank? && user_params[:email].blank?
      redirect_to '/register'
      flash[:alert] = 'ERROR: Please enter a valid name and email'
    elsif !user_params[:name].blank? && user.errors[:email]
      redirect_to '/register'
      flash[:alert] = 'ERROR: Email already in use. Please enter a different email'
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
