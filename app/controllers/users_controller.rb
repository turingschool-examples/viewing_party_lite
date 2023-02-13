class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:error] = 'Invalid email or password'
      render :login_form
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params[:email].downcase!
    params.permit(:name, :email, :password, :password_confirmation)
  end
end