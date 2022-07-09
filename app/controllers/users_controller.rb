class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
  end

  def discover; end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Welcome #{user.name}"
      redirect_to "/users/#{user.id}/dashboard"
    else
      flash[:alert] = 'Could not create user, email must be unique.'
      redirect_to register_path
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
