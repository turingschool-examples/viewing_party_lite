class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new; end

  def create
    new_user = User.create!(user_params)

    redirect_to user_path(id: new_user.id)
  end

  private

  def user_params
    params.permit(:email, :name)
  end
end
