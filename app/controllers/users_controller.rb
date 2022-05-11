class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        flash[:success] = 'Account Successfully Created'
        redirect_to user_dashboard_path(@user)
      else
        flash[:error] = 'Invalid Entry'
        render 'new'
      end
  end

  def show
    @user = User.find(params[:user_id])
  end


  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
