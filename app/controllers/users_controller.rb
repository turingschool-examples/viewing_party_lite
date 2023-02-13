class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages
      render :new
    end
  end

  def show
    set_user
  end

  def login_form
  end

  def login_user
    if User.exists?(email: params[:email])
      user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        redirect_to user_path(user)
      else
        flash[:error] = ['Password is incorrect']
        render :login_form
      end
    else
      flash[:error] = ['Email does not match any in system']
      render :login_form
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
