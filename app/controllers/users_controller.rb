class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  def logout_user
    session[:user_id] = nil
    flash[:success] = 'You have been logged out'
    redirect_to root_path
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:error] = 'Invalid email or password'
      render :login_form
    end
  end

  def show
    if !current_user
      flash[:error] = "Please log in to view your dashboard"
      redirect_to login_path
    end
  end

  private

  def user_params
    params[:email].downcase!
    params.permit(:name, :email, :password, :password_confirmation)
  end
end