class UsersController < ApplicationController
  def new
    
  end

  def create
    User.create!(user_params)
    redirect_to "/"
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.permit(:name, :email)
    end
end