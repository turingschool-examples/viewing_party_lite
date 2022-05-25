class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        flash[:success] = 'Account Successfully Created'
        redirect_to "/login"
      else
        flash[:error] = 'Invalid Entry'
        render 'new'
      end
  end

  def show
    # @user = User.find(params[:user_id])
    if current_user
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
      flash[:alert] = "You must be logged in to do that"
    end
  end

  def discover
    @user = User.find(params[:user_id])
  end

  def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
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
