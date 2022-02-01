class UsersController < ApplicationController
  def show

  end

  def new
  end

  def create
    user = User.create(user_params)

    if user.save(user_params)
      redirect_to user_path(user.id)
      flash[:alert] = "Welcome to your Viewing Party!"
    else
      redirect_to new_user_path
      flash[:error] = "This user could not be created. Please check your form."
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
