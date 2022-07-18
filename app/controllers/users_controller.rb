class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = user.errors.full_messages.first
      redirect_to "/register"
    end
  end

  def show
    @user = User.find(params[:id])
    @invited = ViewingParty.invited(@user)
  end

  def discover
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
