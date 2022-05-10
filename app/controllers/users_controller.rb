class UsersController < ApplicationController
  def new
  end

  def show
  end

  def create
    # binding.pry
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
