class UsersController < ApplicationController
    def index
    end

    def new 
    end

    def show 
        @user = User.find(params[:id])
    end

    def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:success] = "#{user.name} has been created!"
    elsif user.errors.messages[:email].present?
      redirect_to register_path
      flash[:alert] = "Error: That email is already associated with an account."
    elsif user.errors.messages[:password_confirmation].present?
      redirect_to register_path
      flash[:alert] = "Error: Both passwords must match."
    end
  end

    def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:success] = "Welcome back, #{user.name}!"
    else
      redirect_to login_path
      flash[:error] = "Username or password are not correct."
    end
  end

    def discover
        @user = User.find(params[:id])
    end

    private 

    def user_params 
        params.permit(:name, :email)
    end
end