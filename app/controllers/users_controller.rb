class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if current_user
      @user = current_user
      @viewing_partys = @user.viewing_partys
    else
      flash[:error] = 'You must be logged in or registered to acceses that page'
      redirect_to login_path
    end
  end

  def create
    user = User.new(auth_params)
    if user.save
      session[:user_id] = user.id
      redirect_to users_dashboard_path
      flash[:success] = "Welcome, #{user.user_name}!"
    else
      redirect_to '/register'
      flash[:error] = user.errors.full_messages
    end

  end

  def discover
    if current_user
      @user = current_user
    else
      redirect_to login_path
    end
  end

  # def login_form
  # end

  # def login_user
  #   user = User.find_by(email: params[:email])
  #   if user && user.authenticate(params[:password])
  #     redirect_to user_path(user.id)
  #     flash[:success] = "Welcome back, #{user.user_name}!"
  #   else
  #     redirect_to '/login'
  #     flash[:error] = 'Invalid Credentials'
  #   end
  # end

  private

  def auth_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

  def user_params
    params.permit(:user_name, :email)
  end
end
