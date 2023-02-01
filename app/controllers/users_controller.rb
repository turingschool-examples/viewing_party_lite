class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.save(user_params)
      redirect_to user_dashboard_index_path(user)
    else
      flash[:notice] = "Error: All fields must be complete and email must be unique"
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
