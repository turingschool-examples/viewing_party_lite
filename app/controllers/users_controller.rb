class UsersController < ApplicationController
  def show; end

  def new; end

  def create
    new_user = User.create!(user_params)

    redirect_to "/users/#{new_user.id}"
  end

  private

  def user_params
    params.permit(:email, :name)
  end
end
