class UsersController < ApplicationController

  def index

  end

  def new
    @user_new = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    redirect_to "/users/#{User.last.id}"
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
