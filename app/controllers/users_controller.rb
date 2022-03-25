# frozen_string_literal: true

class UsersController < ApplicationController

  def new; end

  def show
    @user = User.find(params[:id])
    @invited = @user.user_viewing_parties
    @hosting = @user.viewing_parties
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def discover
    @user = User.find(params[:id])
  end
  private

  def user_params
    params.permit(:name, :email)
  end


end
