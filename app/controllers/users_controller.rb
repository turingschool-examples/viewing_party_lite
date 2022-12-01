class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def new; end

  def create
    new_user = User.new(user_params)

    if new_user.save
      flash[:alert] = 'User successfully created'
      redirect_to user_path(new_user)
    else
      flash[:alert] = 'Required content missing or invalid'
      redirect_to register_path
    end
  end

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
