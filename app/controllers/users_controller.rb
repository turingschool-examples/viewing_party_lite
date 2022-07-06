class UsersController < ApplicationController
  def new; end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
      flash[:alert] = "You must log in or register to view a dashboard"
    end
  end

  def create
    user = User.new(user_params)

    if params[:password] == params[:password_confirmation]
      if user.save
        session[:user_id] = user.id
        redirect_to "/dashboard"
      else
        redirect_to register_path
        flash[:alert] = "#{error_message(user.errors)}"
      end
    else
      redirect_to register_path
      flash[:alert] = "Passwords must match"
    end
  end

  def login_form; end

  def login_user
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to "/dashboard"
      else
        redirect_to "/login"
        flash[:alert] = "Incorrect Password"
      end
    else
      redirect_to "/login"
      flash[:alert] = "Incorrect Email entered"
    end
  end

  def logout
    session.destroy
    redirect_to "/"
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
