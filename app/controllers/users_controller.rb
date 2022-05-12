class UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy show discover]

  def index
    @users = User.all
  end

  def new; end

  def discover; end

  def show; end

  def update; end

  def destroy; end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user)
    else
      redirect_to '/register'
      flash[:alert] = 'Error: please enter a name and unique email to register.'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
