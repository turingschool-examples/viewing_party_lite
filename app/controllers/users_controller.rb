class UsersController < ApplicationController
  def new; end

  def create
    new_user = User.new(user_params)

    if new_user.save
      flash[:message] = 'User successfully created'
      redirect_to user_path(new_user)
    else
      flash[:error] = 'Required content missing or invalid'
      redirect_to register_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
