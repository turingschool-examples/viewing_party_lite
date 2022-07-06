class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = 'Account Successfully Created'
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = 'Invalid Entry'
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
