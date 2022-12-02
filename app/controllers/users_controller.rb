class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @parties_invited_to = @user.parties_invited_to
    @parties_hosting = @user.parties_hosting
  end

  def new
  end

  def create
    new_user = User.create(user_params)
    if User.exists?(new_user.id)
      redirect_to user_path(new_user)
    else
      redirect_to '/register'
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
