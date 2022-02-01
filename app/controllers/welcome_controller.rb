class WelcomeController < ApplicationController
  def index
    @users = User.all
  end

  def register
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user.id)
  end

  private
    def user_params
      params.permit(:name, :email)
    end
end
