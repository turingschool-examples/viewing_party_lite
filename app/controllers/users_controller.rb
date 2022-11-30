class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      redirect_to(user_path(@user))
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to("/register")
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
