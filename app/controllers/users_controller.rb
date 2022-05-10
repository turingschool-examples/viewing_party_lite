class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create!(user_params)

    if user.save
      redirect_to root_path
    else
      redirect_to "/users/new"
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
