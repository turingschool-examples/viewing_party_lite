class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/users/register"
      flash[:notice] = user.errors.full_messages
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome #{user.name}!"
      redirect_to "/users/#{user.id}"
    end
  end

private
  def user_params
    params.permit(:name, :email, :password_confirmation, :password)
  end

end
