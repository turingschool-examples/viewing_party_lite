class UsersController < ApplicationController
  def new
  end

  def show
  end

  def create
    user = User.new(user_params)
      if user.save
        redirect_to "/users/#{user.id}"
      else
        redirect_to "/users/new"
        flash[:notice] = "Error: User already exists with this email"

      end
  end

private
  def user_params
    params.permit(:name, :email)
  end

end
