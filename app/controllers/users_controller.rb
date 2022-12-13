class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    new_user = User.new(user_params)
    new_user[:email] = new_user[:email].downcase
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to user_path(new_user), success: 'User successfully created'
    else
      redirect_to register_path, alert: 'Required content missing or invalid'
    end
  end

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
  end

  def login_form; end

  def login_user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_dashboard_index_path
      elsif user.manager?
        redirect_to manager_dashboard_path
      elsif user.default?
        redirect_to root_path
      end
      flash[:success] = "Welcome, #{user.name}!"
    else
      flash[:error] = 'Incorrect password'
      render :login_form
    end
  end

  def logout_user
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
