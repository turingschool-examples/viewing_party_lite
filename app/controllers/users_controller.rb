class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to "/users/#{user.id}"
      flash[:notice] = 'Account Successfully Created'
      session[:user_id] = user.id
    else
      redirect_to '/register'
      flash[:alert] = 'Please enter a valid email/ password'
    end
  end

  def login_form; end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    elsif !user
      flash[:error] = "No user exists with email '#{params[:email]}'."
      redirect_to '/login'
    elsif user && user.authenticate(params[:password]) == false
      flash[:error] = 'Sorry, your credentials are bad.'
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end
end
