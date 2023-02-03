# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save(user_params)
      redirect_to user_path(user.id)
    else 
      redirect_to '/register', alert: "Registration failed: #{user.errors.full_messages.to_sentence}"
    end
  end

  def show
    @user = User.find(params[:id])
    @hosting = @user.viewing_parties
    @invited = @user.viewing_party_users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
