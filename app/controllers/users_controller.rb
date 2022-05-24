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

  def discover
    @user = User.find(params[:user_id])
  end

  def login_form
    
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_dashboard_path(user)
    else
      flash[:error] = "Invalid email/password"
      render :login_form
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
