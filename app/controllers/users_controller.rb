class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to "/users/#{user.id}"
      flash[:notice] = 'Account Successfully Created'
    else
      redirect_to "/register"
      flash[:alert] = "Please enter a valid username/email"
    end
  end

  private

  def user_params
    params.permit(:email, :name)
  end
end
