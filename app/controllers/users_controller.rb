class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_parties, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user)
  end

  def show

  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def set_parties
      @parties = @user.parties
    end
end
