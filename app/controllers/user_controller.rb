class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parties = ViewingParty.where(host_id: @user.id)
  end

  def new; end

  def create
    require 'pry'; binding.pry
    user = User.create!(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
