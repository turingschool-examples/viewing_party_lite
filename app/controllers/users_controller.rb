class UsersController < ApplicationController
    def new 
    end

    def show 
        @user = User.find(params[:id])
    end

    def create 
        user = User.create!(user_params)
        if user.save
            redirect_to "/users/#{user.id}"
            flash[:alert] = 'user successfully created'
        else
            redirect_to "/register"
            flash[:error] = 'unable to create user'
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