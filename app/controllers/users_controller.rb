class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def new; end

  def create
    new_user = User.new(user_params)
    new_user[:email] = new_user[:email].downcase
    if new_user.save
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
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = 'Incorrect password'
      render :login_form
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
